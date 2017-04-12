package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.paipianwang.pat.facade.team.service.PmsTeamFacade;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.IndentUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
public class NewPhoneController extends BaseController {
	final Logger serLogger = LoggerFactory.getLogger("service");
	final Logger logger = LoggerFactory.getLogger("error");

	@Autowired
	final private PmsProductFacade pmsProductFacade = null;
	
	@Autowired
	final private PmsTeamFacade pmsTeamFacade = null;
	/**
	 * 订单跳转页面
	 * 
	 * @param productId
	 *            产品编号
	 */
	@RequestMapping("/direct/order")
	public ModelAndView orderRedirectView(final HttpServletRequest request, final ModelMap model)
			throws UnsupportedEncodingException {

		try {
			final PmsIndent indent = new PmsIndent();
			indent.setTeamId(-1l);
			indent.setProductId(-1l);
			indent.setServiceId(-1l);
			final String token = IndentUtil.generateOrderToken(request, indent);
			model.addAttribute("token", token);
			SessionInfo sessionInfo = 	getCurrentInfo(request);
			model.addAttribute("sessionInfo", sessionInfo);
		} catch (Exception e) {
			logger.error(
					"method PhoneController orderRedirectView ,direct order has error,bacase generate order use AES Decrypt token error ...");
			e.printStackTrace();
		}
		// modify by Jack, 2016-06-22 19:38 end

		return new ModelAndView("/order", model);
	}

	// 跳转 订单页
	@RequestMapping("/order")
	public ModelAndView orderView(final HttpServletRequest request, final ModelMap model) {
		final String json = request.getParameter("json");
		final PmsIndent indent = new PmsIndent().fromString(json, PmsIndent.class);
		try {
			final String productName = URLDecoder.decode(indent.getProduct_name(), "UTF-8");
			indent.setProduct_name(productName);
			final String token = IndentUtil.generateOrderToken(request, indent);
			model.addAttribute("token", token);
			// modify by Jack, 2016-06-22 19:36 end
			SessionInfo sessionInfo = 	getCurrentInfo(request);
			model.addAttribute("sessionInfo", sessionInfo);
			
			serLogger.info("Order at Phone,teamId:" + indent.getTeamId() + " ,productId:" + indent.getProductId()
					+ " ,indentPrice:" + indent.getIndentPrice());
		} catch (Exception e) {
			logger.error("phone order is error ...");
			logger.error(
					"method PhoneController orderView ,order has error,bacase generate order use AES Decrypt token error ...");
			e.printStackTrace();
		}

		return new ModelAndView("/order", model);
	}
	
	// 活动下单页
	@RequestMapping("/activity/order/{productId}")
	public ModelAndView newOrderView(final HttpServletRequest request, final ModelMap model,
			@PathVariable("productId") Long id) {
		try {
			final PmsIndent indent = new PmsIndent();
			
			final PmsProduct product = pmsProductFacade.loadProduct(Integer.valueOf(id + ""));
			if (product.getTeamId() != null && !"".equals(product.getTeamId())) {
				final PmsTeam team = pmsTeamFacade.findTeamById(product.getTeamId());
				if (team != null) {
					product.setTeamDescription(team.getTeamDescription());
					product.setTeamName(team.getTeamName());
					product.setTeamPhotoUrl(team.getTeamPhotoUrl());
				}
			}
			
			indent.setTeamId(product.getTeamId());
			indent.setProductId(product.getProductId());
			indent.setIndentPrice(product.getServiceRealPrice());
			indent.setServiceId(product.getServiceId());
			indent.setSecond(product.getMcoms());
			indent.setProduct_name(product.getProductName());
			
			SessionInfo sessionInfo = 	getCurrentInfo(request);
			final String token = IndentUtil.generateOrderToken(request, indent);
			model.addAttribute("token", token);
			model.addAttribute("sessionInfo", sessionInfo);
			model.addAttribute("activity", 1);
			// modify by Jack, 2016-06-22 19:36 end
			serLogger.info("Order at Phone,teamId:" + indent.getTeamId() + " ,productId:" + indent.getProductId()
					+ " ,indentPrice:" + indent.getIndentPrice());
		} catch (Exception e) {
			logger.error("phone order is error ...");
			logger.error(
					"method PhoneController orderView ,order has error,bacase generate order use AES Decrypt token error ...");
			e.printStackTrace();
		}

		return new ModelAndView("/order", model);
	}

	@RequestMapping("/searchview")
	public ModelAndView searchView(final ModelMap model) {

		return new ModelAndView("/searchView", model);
	}

	@RequestMapping("/")
	public ModelAndView portalView(final ModelMap model, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		model.put("sessionInfo", sessionInfo);
		return new ModelAndView("/portal", model);
	}

	// 跳转至 移动端 活动页面
	@RequestMapping("/activity.html")
	public ModelAndView activityView(final ModelMap model, final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "/portal/activity";
		final String json = HttpUtil.httpGet(url, request);
		if (ValidateUtil.isValid(json)) {
			try {
				List<PmsProduct> products = JsonUtil.fromJsonArray(json, PmsProduct.class);
				model.put("products", products);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView("/activity");
	}

}
