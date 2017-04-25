package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.enums.SourceChannelsEnum;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.common.web.domain.ResourceToken;
import com.paipianwang.pat.facade.employee.entity.PmsJob;
import com.paipianwang.pat.facade.information.entity.PmsProductSolr;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.paipianwang.pat.facade.team.service.PmsTeamFacade;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.resource.model.Staff;
import com.panfeng.web.wearable.resource.view.ProductView;
import com.panfeng.web.wearable.resource.view.SolrView;
import com.panfeng.web.wearable.service.SolrService;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

/**
 * PC端 控制器
 * 
 * @author GY
 */
@RestController
public class PCController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log

	final Logger logger = LoggerFactory.getLogger("error");

	@Autowired
	final private SolrService solrService = null;

	@Autowired
	final private PmsTeamFacade pmsTeamFacade = null;
	
	@Autowired
	final private PmsProductFacade pmsProductFacade = null;

	@RequestMapping("/")
	public ModelAndView portalView(final String target,final ModelMap model, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		model.put("sessionInfo", sessionInfo);
		
		// target 是标识流量来源
		if(StringUtils.isNotBlank(target)) {
			final SourceChannelsEnum sce = SourceChannelsEnum.getEnum(target);
			if(sce != null)
				request.getSession().setAttribute(PmsConstant.SOURCE_CHANNELS, sce.getDesc());
		}
		return new ModelAndView("/portal", model);
	}
	
	// 下单成功后跳转至成功页面
	@RequestMapping("/success")
	public ModelAndView successView(final ModelMap model) {

		return new ModelAndView("success", model);
	}

	/**
	 * 活动页面 下单
	 */
	@RequestMapping("/order/{teamId}/{productId}/{serviceId}/{indentPrice}/{productName}")
	public ModelAndView activeOrderView(final ModelMap model, final HttpServletRequest request,
			@PathVariable("teamId") final Long teamId, @PathVariable("productId") final Long productId,
			@PathVariable("serviceId") final Long serviceId, @PathVariable("indentPrice") final Double indentPrice,
			@PathVariable("productName") final String productName) {

		final PmsUser user = (PmsUser) request.getSession().getAttribute("username");
		model.addAttribute("teamId", teamId);
		model.addAttribute("productId", productId);
		model.addAttribute("serviceId", serviceId);
		model.addAttribute("indentPrice", indentPrice);
		model.addAttribute("second", 0);
		try {
			model.addAttribute("product_name", URLDecoder.decode(productName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			logger.error("PCContronller method:activeOrderView() productName URLDecoder error ...");
			e.printStackTrace();
		}
		model.addAttribute("telephone", user != null ? user.getTelephone() : "");

		serLogger.info("PCController Redirect Activity order page,product_id:" + productId);
		return new ModelAndView("order", model);
	}

	/**
	 * 加载 视频列表
	 * 
	 * @param view
	 *            条件
	 * @return List<PmsProduct> 产品列表
	 */
	@RequestMapping(value = "/product/listWithCondition", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<PmsProduct> list(@RequestBody final ProductView view, final HttpServletRequest request) {

		List<PmsProduct> list = new ArrayList<PmsProduct>();
		final String url = PublicConfig.URL_PREFIX + "portal/product/static/listWithCondition";
		String str = HttpUtil.httpPost(url, view, request);
		if (str != null && !"".equals(str)) {
			list = JsonUtil.toList(str);
		}

		serLogger.info("List With Condition,productType:" + view.getProductType());
		return list;
	}

	/**
	 * 加载 主页 视频列表
	 * 
	 * @param view
	 *            条件
	 * @return List<PmsProduct> 产品列表
	 */
	@RequestMapping(value = "/product/loadProduct", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<PmsProductSolr> productList(final HttpServletRequest request, @RequestBody SolrView solrView) {

		final SolrQuery query = new SolrQuery();
		query.set("qf", "productName^4 tags^3 teamName^2 pDescription^1");
		query.setQuery("*:*");
		query.setFields(
				"teamId,productId,productName,productType,itemName,teamName,orignalPrice,price,picLDUrl,length,pDescription,recommend,supportCount,tags");
		query.setStart(0);
		query.setRows(Integer.MAX_VALUE);
		if (null != solrView.getSort()) {
			query.setSort(solrView.getSort(), ORDER.desc);
		}
		final List<PmsProductSolr> list = solrService.queryDocs(PublicConfig.SOLR_PORTAL_URL, query);

		serLogger.info("Load portal page products,size:" + list.size());
		return list;
	}

	@RequestMapping("/play/{teamId}_{productId}.html")
	public ModelAndView play(@PathVariable("teamId") final Integer teamId,
			@PathVariable("productId") final Integer productId, final ModelMap model,
			final HttpServletRequest request) {
		model.addAttribute("teamId", teamId);
		model.addAttribute("productId", productId);
		final PmsProduct product = pmsProductFacade.loadProduct(productId);
		if (product.getTeamId() != null && !"".equals(product.getTeamId())) {
			final PmsTeam team = pmsTeamFacade.findTeamById(product.getTeamId());
			if (team != null) {
				product.setTeamDescription(team.getTeamDescription());
				product.setTeamName(team.getTeamName());
				product.setTeamPhotoUrl(team.getTeamPhotoUrl());
			}
		}
		model.addAttribute("product", product);

		serLogger.info("Redirect team page,teamId:" + teamId + " ,productId:" + productId);
		return new ModelAndView("play", model);
	}

	/**
	 * 根据 团队名称 去solr中 加载 产品列表
	 * 
	 * @param teamName
	 */
	@RequestMapping("/product/order/loadWithTeamName")
	public List<PmsProductSolr> productInformationByTeamOrder(@RequestBody final SolrView solrView,
			final HttpServletRequest request) {

		final ResourceToken token = (ResourceToken) request.getAttribute("resourceToken"); // 访问资源库令牌
		String condition = solrView.getCondition();
		final SolrQuery query = new SolrQuery();
		query.set("defType", "edismax");
		query.set("q.alt", "*:*");
		query.set("qf", "teamName");
		if (StringUtils.isNotBlank(condition)) {
			query.setQuery(condition);
		} else {
			return null;
		}
		query.setSort("creationTime", ORDER.desc);
		query.set("pf", "teamName");
		query.set("tie", "0.1");
		query.setFields("teamId,productId,productName,orignalPrice,price,picLDUrl,tags,creationTime,pDescription");
		query.setStart(Integer.parseInt(String.valueOf(solrView.getBegin())));
		query.setRows(Integer.parseInt(String.valueOf(solrView.getLimit())));

		final List<PmsProductSolr> list = solrService.queryDocs(token.getSolrUrl(), query);
		for (PmsProductSolr pmsProductSolr : list) {
			String tags = pmsProductSolr.getTags();
			if(StringUtils.isNotBlank(tags))
				pmsProductSolr.setTags(tags.trim().replaceAll("(\\s*)(,|，|\\s+)(\\s*)", " "));
		}
		return list;
	}

	// 发送预约提示信息
	@RequestMapping("/appointment/{telephone}")
	public boolean appointment(final HttpServletRequest request, @PathVariable("telephone") final String telephone) {
		if (telephone != null && !"".equals(telephone)) {
			final String url = PublicConfig.URL_PREFIX + "portal/indent/appointment" + telephone;
			final String json = HttpUtil.httpGet(url, request);
			boolean result = JsonUtil.toBean(json, boolean.class);
			SessionInfo sessionInfo = getCurrentInfo(request);
			serLogger.info("send Message to telephone:" + telephone, sessionInfo);
			return result;
		}
		return false;
	}

	// 百度 推广
	@RequestMapping("/baidu_verify_xwk5yhHcpk.html")
	public ModelAndView popularize(final ModelMap model) {

		return new ModelAndView("baidu_verify_xwk5yhHcpk");
	}

	// 百度 推广
	@RequestMapping("/sitemap.html")
	public ModelAndView popularizeSiteMap(final ModelMap model) {

		return new ModelAndView("sitemap");
	}

	@RequestMapping("/member.html")
	public ModelAndView introduceView(final HttpServletRequest request, final ModelMap model) throws Exception {

		// 查询所有人信息
		final String url = PublicConfig.URL_PREFIX + "portal/staff/static/list";
		final String json = HttpUtil.httpGet(url, request);
		List<Staff> list = new ArrayList<Staff>();
		if (ValidateUtil.isValid(json)) {
			list = JsonUtil.fromJsonArray(json, Staff.class);
			model.addAttribute("list", list);
		}

		List<PmsJob> jobList = new ArrayList<PmsJob>();
		final String jobUrl = PublicConfig.URL_PREFIX + "portal/job/static/list";
		final String str = HttpUtil.httpGet(jobUrl, request);
		if (ValidateUtil.isValid(str)) {
			jobList = JsonUtil.fromJsonArray(str, PmsJob.class);
			model.addAttribute("jobList", jobList);
		}
		SessionInfo sessionInfo = getCurrentInfo(request);
		model.put("sessionInfo", sessionInfo);
		return new ModelAndView("/member");
	}

	/**
	 * 首页获取导演推荐
	 */
	@RequestMapping(value = "/team/recommend", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public BaseMsg getRecommendTeam(final HttpServletRequest request) {
		BaseMsg baseMsg = new BaseMsg();
		List<PmsTeam> teamRecommendList = pmsTeamFacade.teamRecommendList();
		if (ValidateUtil.isValid(teamRecommendList)) {
			// 取出tags标签
			for (PmsTeam pmsTeam : teamRecommendList) {
				// 加载导演标签
				String strtags = pmsTeam.getBusiness();
				if (ValidateUtil.isValid(strtags)) {
					try {
						String[] tagsarray = strtags.split("\\,");
						List<Integer> ids = new ArrayList<>();
						for (int i = 0; i < tagsarray.length; i++) {
							ids.add(Integer.parseInt(tagsarray[i]));
						}
						List<String> tags = pmsTeamFacade.getTags(ids);
						if (ValidateUtil.isValid(tags)) {
							pmsTeam.setBusiness(JsonUtil.toJson(tags));
						}
					} catch (NumberFormatException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					logger.error("provider business is null ...");
				}
			}
			baseMsg.setCode(1);
			baseMsg.setResult(teamRecommendList);
		} else {
			baseMsg.setErrorMsg("list is null");
		}
		return baseMsg;
	}
}
