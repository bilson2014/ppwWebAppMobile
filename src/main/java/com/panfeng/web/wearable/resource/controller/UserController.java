package com.panfeng.web.wearable.resource.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.service.SmsService;
import com.panfeng.web.wearable.util.DataUtil;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

	@Autowired
	private SmsService smsService = null;

	final Logger logger = LoggerFactory.getLogger("error");

	final Logger serLogger = LoggerFactory.getLogger("service");

	/**
	 * 发送验证码
	 */
	@RequestMapping("/verification/{telephone}")
	public boolean verification(final HttpServletRequest request, @PathVariable("telephone") final String telephone) {

		final String code = DataUtil.random(true, 6);
		request.getSession().setAttribute("code", code); // 存放验证码
		request.getSession().setAttribute("codeOfphone", telephone); // 存放手机号
		final boolean ret = smsService.smsSend(PublicConfig.SMS_VERIFICATION_CODE, telephone,
				new String[] { code, PublicConfig.SMS_CODE_DURATION + "分钟" });
		serLogger.info(
				"phone number is " + telephone + " send sms code to update user telephone number -success=" + ret);
		return ret;
	}

	/**
	 * 用户信息-修改手机号码 清除session中的验证码
	 */
	@RequestMapping("/clear/code")
	public int clearCode(final HttpServletRequest request) {

		request.getSession().removeAttribute("code");
		return 0;
	}

	@RequestMapping("/updatePwd")
	public ModelAndView updatePwd(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("userType", PmsConstant.ROLE_CUSTOMER);
		SessionInfo sessionInfo = getCurrentInfo(request);
		modelMap.addAttribute("userLoginName", sessionInfo.getLoginName());
		modelMap.addAttribute("userId", sessionInfo.getReqiureId());
		return new ModelAndView("/updatePwd", modelMap);
	}

	/**
	 * 第三方绑定状态
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/third/status")
	public Map<String, Object> thirdBindStatus(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		SessionInfo sessionInfo = getCurrentInfo(request);
		PmsUser user = new PmsUser();
		user.setId(sessionInfo.getReqiureId());
		final String url = PublicConfig.URL_PREFIX + "portal/user/third/status";
		final String json = HttpUtil.httpPost(url, user, request);
		result = JsonUtil.toBean(json, Map.class);
		return result;
	}

	/**
	 * 个人中心绑定第三方 如果第三方账号已经存在,不允许绑定
	 */
	@RequestMapping("/bind/third")
	public BaseMsg bindThird(final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody final PmsUser user) {
		BaseMsg baseMsg = new BaseMsg(0, "绑定失败");
		SessionInfo sessionInfo = getCurrentInfo(request);
		user.setId(sessionInfo.getReqiureId());// 填充用户id
		final String url = PublicConfig.URL_PREFIX + "portal/user/info/bind";
		String str = HttpUtil.httpPost(url, user, request);
		Boolean b = JsonUtil.toBean(str, Boolean.class);
		if (b) {
			baseMsg.setCode(1);
			baseMsg.setResult("绑定成功");
		} else
			baseMsg.setResult("账号存在绑定");
		return baseMsg;
	}

	/**
	 * 个人中心解除第三方绑定
	 */
	@RequestMapping("/unbind/third")
	public boolean unBindThird(@RequestBody final PmsUser user, final HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		user.setId(sessionInfo.getReqiureId());// 填充用户id
		// 查询该用户是否存在
		final String url = PublicConfig.URL_PREFIX + "portal/user/info/unbind";
		String str = HttpUtil.httpPost(url, user, request);
		Boolean b = JsonUtil.toBean(str, Boolean.class);
		return b;
	}

	/**
	 * 个人中心解除第三方绑定
	 */
	@RequestMapping("/unique/username")
	public boolean uniqueUserName(@RequestBody final PmsUser user, final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "portal/user/unique/username";
		String str = HttpUtil.httpPost(url, user, request);
		Boolean b = JsonUtil.toBean(str, Boolean.class);
		return b;
	}
}
