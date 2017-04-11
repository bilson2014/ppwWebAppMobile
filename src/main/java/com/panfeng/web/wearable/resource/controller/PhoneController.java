package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
@RequestMapping("/phone")
public class PhoneController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log

	final Logger logger = LoggerFactory.getLogger("error");

	/**
	 * 活动页面 下单
	 */
	@RequestMapping("/order/{teamId}/{productId}/{serviceId}/{indentPrice}/{productName}")
	public ModelAndView activeOrderView(final ModelMap model, final HttpServletRequest request,
			@PathVariable("teamId") final Long teamId, @PathVariable("productId") final Long productId,
			@PathVariable("serviceId") final Long serviceId, @PathVariable("indentPrice") final Double indentPrice,
			@PathVariable("productName") final String productName) {

		model.addAttribute("teamId", teamId);
		model.addAttribute("productId", productId);
		model.addAttribute("serviceId", serviceId);
		model.addAttribute("indentPrice", indentPrice);
		model.addAttribute("second", 0);

		try {
			model.addAttribute("product_name", URLDecoder.decode(productName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			logger.error("PhoneController method:activeOrderView() URLDecoder error ...");
			e.printStackTrace();
		}

		serLogger.info(
				"Activity order at Phone,teamId:" + teamId + " ,productId:" + productId + " ,price:" + indentPrice);
		return new ModelAndView("/order", model);
	}

	// 跳转至 移动端 分类页面
	@RequestMapping("/classify/{itemId}")
	public ModelAndView classifyView(final ModelMap model, @PathVariable("itemId") final long itemId) {

		model.addAttribute("itemNo", itemId);
		return new ModelAndView("/classify");
	}

	@RequestMapping("/user/index")
	public ModelAndView goToIndex(ModelMap modelMap, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		modelMap.put("userInfo", sessionInfo);
		return new ModelAndView("/project", modelMap);
	}

	@RequestMapping("/user/exinfo")
	public ModelAndView userInfo(ModelMap modelMap, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		String userType = sessionInfo.getSessionType();
		long id = sessionInfo.getReqiureId();
		final String url;
		switch (userType) {
		case PmsConstant.ROLE_CUSTOMER:
			url = PublicConfig.URL_PREFIX + "/portal/user/info/" + id;
			String json = HttpUtil.httpGet(url, request);
			if (json != null && !"".equals(json)) {
				PmsUser user = JsonUtil.toBean(json, PmsUser.class);
				modelMap.put("userinfo", user);
				return new ModelAndView("/customer/customerInfo", modelMap);
			}
			break;
		case PmsConstant.ROLE_EMPLOYEE:
			return null;
		case PmsConstant.ROLE_PROVIDER:
			return null;
		}

		return null;
	}
}
