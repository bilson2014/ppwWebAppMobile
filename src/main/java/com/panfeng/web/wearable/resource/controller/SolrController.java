package com.panfeng.web.wearable.resource.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.util.SolrUtil;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.common.web.domain.ResourceToken;
import com.paipianwang.pat.facade.information.entity.PmsNewsSolr;
import com.paipianwang.pat.facade.information.entity.PmsProductSolr;
import com.paipianwang.pat.facade.product.entity.TdkItem;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.resource.model.Solr;
import com.panfeng.web.wearable.resource.view.SolrView;
import com.panfeng.web.wearable.service.SolrService;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
public class SolrController extends BaseController {

	final Logger logger = LoggerFactory.getLogger("error");

	final Logger serLogger = LoggerFactory.getLogger("service");

	final Logger keywordsLogger = LoggerFactory.getLogger("keywords");

	@Autowired
	final private SolrService solrService = null;
	
	@Autowired
	private PmsProductFacade pmsProductFacade=null;

	@RequestMapping("/search")
	public ModelAndView searchView(String q, final String industry, final String genre, final String production,
			final String price, final String source, final boolean isMore, final String target, final ModelMap model, final HttpServletRequest request)
			throws Exception {

		// 检查 参数q 是否为空
		if (ValidateUtil.isValid(q)) {
			// 处理停词问题
			if (q.contains("宣传片") || q.contains("广告") || q.contains("动画")) {
				final StringBuffer sb = new StringBuffer();
				q = q.replaceAll("“+", "\"").replaceAll("”+", "\"").replaceAll(",", " ").replaceAll(" +", " ");
				String[] tags = q.split(" ");
				for (int i = 0; i < tags.length; i++) {
					String tag = tags[i];
					if("宣传片".equals(tags[i]) || "广告".equals(tags[i]) || "广告片".equals(tags[i]) || "动画".equals(tags[i]) || "动画片".equals(tags[i])) {
						if (tag.equals("广告片"))
							tag = "广告";
						if (tag.equals("动画片"))
							tag = "动画";
						tag = "*" + tag;
					}
					if (i < tags.length - 1)
						sb.append(tag).append(" ");
					else
						sb.append(tag);
				}
				q = sb.toString();
			}
		} else
			q = "*";

		model.addAttribute("q", q);
		model.addAttribute("price", price);
		model.addAttribute("production", production);
		model.addAttribute("industry", industry);
		model.addAttribute("source", source);
		model.addAttribute("genre", genre);
		model.addAttribute("isMore", isMore);
		
		//设置tdk
		TdkItem tdk=pmsProductFacade.getTDKByKey(ValidateUtil.isValid(target)?target:"jpal");
				
		model.addAttribute("title",tdk==null?"企业宣传视频_产品广告视频_活动视频制作案例大全-拍片网":tdk.getTitle());
		model.addAttribute("description",tdk==null?"企业宣传视频,产品广告视频,活动视频制作案例":tdk.getDescription());
		model.addAttribute("keywords",tdk==null?"拍片网汇聚各种企业宣传类视频、产品广告类视频以及活动类视频，涵盖各种类型的商业视频案例。":tdk.getKeywords());

		final SolrView view = new SolrView();
		view.setCondition(q);
		view.setIndustry(industry);
		view.setGenre(genre);
		view.setProduction(production);
		view.setPriceFq(price);
		view.setSourceFq(source);
		// 设置是否是从相关性推荐过来的
		view.setMore(isMore);
		view.setLimit(20l);

		final List<PmsProductSolr> list = solrService.listWithPagination(view, request);

		long total = 0l;
		if (list != null && !list.isEmpty()) {
			final PmsProductSolr s = list.get(0);
			if (s != null) {
				total = s.getTotal(); // 设置总数
			}
		}

		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return new ModelAndView("search", model);
	}

	// 搜索分页
	@RequestMapping("/search/pagination")
	public List<PmsProductSolr> searchPagination(@RequestBody final SolrView view, final HttpServletRequest request)
			throws Exception {
		final List<PmsProductSolr> list = solrService.listWithPagination(view, request);
		return list;
	}

	@RequestMapping("/suggest/{token}")
	public List<Solr> suggest(@PathVariable("token") final String token, final HttpServletRequest request) {

		if (token != null && !"".equals(token)) {
			try {
				final String word = URLDecoder.decode(token, "UTF-8");

				String url = PublicConfig.URL_PREFIX + "portal/solr/suggest/" + word;
				final String json = HttpUtil.httpGet(url, request);
				if (json != null && !"".equals(json)) {
					List<Solr> list = JsonUtil.fromJsonArray(json, Solr.class);
					return list;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 新闻列表视图页
	 * 
	 * @param q
	 * @param model
	 * @param requestz
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/news-list.html")
	public ModelAndView searchNewView(String q, final ModelMap model, final HttpServletRequest request)
			throws Exception {

		final SolrView view = new SolrView();

		if ("最热资讯".equals(q)) {
			// 筛选 推荐值大于0 的新闻
			view.setRecomendFq("[1 TO *]");
			q = null;
		}

		view.setCondition(q);
		model.addAttribute("q", q);
		view.setLimit(20l);

		final List<PmsNewsSolr> list = solrService.queryNewDocs(PublicConfig.SOLR_NEWS_URL, view);
		long total = 0l;
		if (ValidateUtil.isValid(list)) {
			final PmsNewsSolr s = list.get(0);
			if (s != null) {
				total = s.getTotal(); // 设置总数
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return new ModelAndView("news/newsList", model);
	}

	// 搜索分页
	@RequestMapping("/search/news/pagination")
	public List<PmsNewsSolr> searchNewsPagination(@RequestBody final SolrView view, final HttpServletRequest request)
			throws Exception {

		final String condition = view.getCondition();

		if ("最热资讯".equals(condition)) {
			// 筛选 推荐值大于0 的新闻
			view.setRecomendFq("[1 TO *]");
		}

		final List<PmsNewsSolr> list = solrService.queryNewDocs(PublicConfig.SOLR_NEWS_URL, view);
		return list;
	}

	/**
	 * 播放界面获取更多推荐作品 根据tags来搜索 参数：condition 表示tag标签
	 */
	@RequestMapping("/tags/product/search")
	public BaseMsg getMoreProductByTags(final HttpServletRequest request, @RequestBody final SolrView solrView) {
		BaseMsg baseMsg = new BaseMsg();

		final ResourceToken token = (ResourceToken) request.getAttribute("resourceToken"); // 访问资源库令牌
		if (token != null) {
			String condition = solrView.getCondition();
			final SolrQuery query = new SolrQuery();
			query.set("defType", "edismax");
			query.set("q.alt", "*:*");
			query.set("qf", "productName^2.3 tags");

			if (StringUtils.isNotBlank(condition)) {
				// 如果有标签的话，那么判断condition按照标签搜索
				// 分析标签优先级顺序，按顺序权重依次降低
				condition = SolrUtil.ReweightingByTags(condition);
				query.setQuery(condition);
			} else {
				// 没有标签，则相关视频推荐为空
				return null;
			}
			query.set("pf", "tags^2.3 productName");
			query.set("tie", "0.1");
			query.setFields(
					"teamId,teamName,productId,productName,orignalPrice,price,picLDUrl,tags,indentProjectId,teamPhotoUrl,teamFlag");
			query.setStart((int) solrView.getBegin());
			query.setRows((int) solrView.getLimit());

			final List<PmsProductSolr> list = solrService.queryDocs(token.getSolrUrl(), query);
			if (ValidateUtil.isValid(list)) {
				Map<String, Object> map = new HashMap<>();
				long total = 0;
				total = list.get(0).getTotal();
				map.put("total", total);
				map.put("result", list);
				baseMsg.setCode(1);
				baseMsg.setResult(map);
				return baseMsg;
			}

		}

		baseMsg.setErrorCode(BaseMsg.ERROR);
		baseMsg.setErrorMsg("list is null");
		return baseMsg;
	}
}
