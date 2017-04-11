package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.paipianwang.pat.facade.information.entity.PmsNewsSolr;
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

	@RequestMapping("/search")
	public ModelAndView phoneSearchView(String q, final String sequence, final int sortord, final String item,
			final ModelMap model, final HttpServletRequest request) throws Exception {
		if ("".equals(q)) {
			q = "*";
		}
		model.addAttribute("q", q);
		model.addAttribute("sequence", sequence);
		model.addAttribute("sortord", sortord);
		model.addAttribute("item", item);
		SolrView view = new SolrView();
		view.setCondition(URLEncoder.encode(q, "UTF-8"));
		view.setItemFq(item);
		view.setSequence(sequence);
		view.setSortord(sortord);
		try {
			String url = PublicConfig.URL_PREFIX + "portal/solr/phone/query";
			final String json = HttpUtil.httpPost(url, view, request);
			if (json != null && !"".equals(json)) {
				List<Solr> list = JsonUtil.fromJsonArray(json, Solr.class);
				
				model.addAttribute("list", list);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error("SolrController method:phoneSearchView() encode failue,q=" + q);
		}
		
		if("*".equals(q)) {
			String cdn = q.trim().replaceAll("(\\s*)(,|，|\\s+)(\\s*)", ",");
			keywordsLogger.info("q=" + cdn);
		}
		return new ModelAndView("/search");
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
		model.addAttribute("q", q);
		view.setLimit(20l);

		final List<PmsNewsSolr> list = solrService.queryNewDocs(PublicConfig.SOLR_NEWS_URL, view);

		long total = 0l;
		final PmsNewsSolr s = list.get(0);
		if (s != null) {
			total = s.getTotal(); // 设置总数
		}
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return new ModelAndView("newsInfo", model);
	}

	/**
	 * 新闻便签数据获取（最热，推荐）
	 * 
	 * @param q
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/get/news/tag")
	public List<PmsNewsSolr> searchNewByTagsView(String q, HttpServletRequest request) throws Exception {
		final SolrView view = new SolrView();
		if ("最热资讯".equals(q)) {
			// 筛选 推荐值大于0 的新闻
			view.setRecomendFq("[1 TO *]");
			q = null;
		}

		view.setLimit(20l);

		final List<PmsNewsSolr> list = solrService.queryNewDocs(PublicConfig.SOLR_NEWS_URL, view);
		return list;
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
}
