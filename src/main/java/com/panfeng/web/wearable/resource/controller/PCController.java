package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.common.web.domain.ResourceToken;
import com.paipianwang.pat.common.web.file.FastDFSClient;
import com.paipianwang.pat.facade.employee.entity.PmsJob;
import com.paipianwang.pat.facade.employee.entity.PmsStaff;
import com.paipianwang.pat.facade.employee.service.PmsJobFacade;
import com.paipianwang.pat.facade.employee.service.PmsStaffFacade;
import com.paipianwang.pat.facade.information.entity.PmsNews;
import com.paipianwang.pat.facade.information.entity.PmsProductSolr;
import com.paipianwang.pat.facade.information.service.PmsNewsFacade;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.paipianwang.pat.facade.team.service.PmsTeamFacade;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.panfeng.web.wearable.dao.StorageLocateDao;
import com.panfeng.web.wearable.domain.BaseMsg;
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

	@Autowired
	final PmsNewsFacade pmsNewsFacade = null;
	
	@Autowired
	final PmsJobFacade pmsJobFacade = null;
	
	@Autowired
	final PmsStaffFacade pmsStaffFacade = null;
	
	@Autowired
	private final StorageLocateDao storageDao = null;

	@RequestMapping("/")
	public ModelAndView portalView(final String target, final ModelMap model, HttpServletRequest request) {

		SessionInfo sessionInfo = getCurrentInfo(request);
		model.put("sessionInfo", sessionInfo);
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
				//优先使用昵称
				if(ValidateUtil.isValid(team.getDisplayName())){
					product.setTeamName(team.getDisplayName());
				}else{
					product.setTeamName(team.getTeamName());
				}
				if(ValidateUtil.isValid(team.getDisplayImg())){
					product.setTeamPhotoUrl(team.getDisplayImg());
				}else{
					product.setTeamPhotoUrl(team.getTeamPhotoUrl());
				}
				model.addAttribute("teamFlag", team.getFlag());
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
			if (StringUtils.isNotBlank(tags))
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

		// 查询公司人员信息
		List<PmsStaff> list = pmsStaffFacade.getAll();
		model.addAttribute("list", list);

		final List<PmsJob> jobList = pmsJobFacade.getAll();
		model.addAttribute("jobList", jobList);
		
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
					pmsTeam.setBusiness(JsonUtil.toJson(strtags.split(",")));
				} else {
					logger.error("provider business is null ...");
				}
				//优先使用昵称
				if(ValidateUtil.isValid(pmsTeam.getDisplayName())){
					pmsTeam.setTeamName(pmsTeam.getDisplayName());
				}
				if(ValidateUtil.isValid(pmsTeam.getDisplayImg())){
					pmsTeam.setTeamPhotoUrl(pmsTeam.getDisplayImg());
				}
			}
			baseMsg.setCode(1);
			baseMsg.setResult(teamRecommendList);
		} else {
			baseMsg.setErrorMsg("list is null");
		}
		return baseMsg;
	}

	/**
	 * 跳转新闻详情
	 */
	@RequestMapping(value = "/news/article-{newId}.html")
	public ModelAndView getRecommendNews(@PathVariable("newId") final Integer newId, final HttpServletRequest request,
			final ModelMap model) {

		// 当前新闻
		PmsNews pmsNews = new PmsNews();

		// 获取新闻详情
		if (newId != null) {
			pmsNews = pmsNewsFacade.findNewsById(newId);
			String content = pmsNews.getContent();
			byte[] b;
			try {
				b = content.getBytes("UTF-8");
				content = new String(Base64Utils.decode(b), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			pmsNews.setContent(content);

		} else {
			// 请求不存在的新闻
			return new ModelAndView("/error");
		}

		model.addAttribute("news", pmsNews);

		return new ModelAndView("/news/newsInfo");

	}
	
	@RequestMapping(value="/getStorageUrl")
	public BaseMsg getStorageUrl(final HttpServletRequest request){
		BaseMsg result=new BaseMsg();
		final Map<String, String> nodeMap = storageDao.getStorageFromRedis(PmsConstant.STORAGE_NODE_RELATIONSHIP);
		// 获取最优Storage节点
		final String serviceIP = FastDFSClient.locateSource();
		String ip = "";
		final StringBuffer sbf = new StringBuffer();
		sbf.append("https://");
		
		if(ValidateUtil.isValid(serviceIP)) {
			ip = nodeMap.get(serviceIP);
			if(ValidateUtil.isValid(ip)) {
				sbf.append(ip);
//				sbf.append(":8888/");
			} else {
				sbf.append(PublicConfig.FDFS_BACKUP_SERVER_PATH);
			}
		} else {
			sbf.append(PublicConfig.FDFS_BACKUP_SERVER_PATH);
		}
		
//		mv.addObject(PmsConstant.FILE_LOCATE_STORAGE_PATH, sbf.toString());
		result.setResult(sbf.toString());
		
		return result;
	}
}
