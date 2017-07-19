package com.panfeng.web.wearable.resource.controller;

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
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.paipianwang.pat.facade.user.service.PmsUserFacade;
import com.panfeng.web.wearable.service.SmsService;
import com.panfeng.web.wearable.util.DataUtil;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

	@Autowired
	private SmsService smsService = null;

	final Logger logger = LoggerFactory.getLogger("error");

	final Logger serLogger = LoggerFactory.getLogger("service");
	
	@Autowired
	private final PmsUserFacade pmsUserFacade = null;

	/*@RequestMapping("/user/index")
	public ModelAndView goToIndex(ModelMap modelMap, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		modelMap.put("userInfo", sessionInfo);
		return new ModelAndView("/project", modelMap);
	}*/
	
	/**
	 * 用户信息页
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping("/info")
	public ModelAndView userInfo(ModelMap modelMap, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		String userType = sessionInfo.getSessionType();
		long id = sessionInfo.getReqiureId();
		switch (userType) {
		case PmsConstant.ROLE_CUSTOMER:
			final PmsUser user = pmsUserFacade.findUserById(id);
			modelMap.put("userinfo", user);
			return new ModelAndView("/customer/customerInfo", modelMap);
		case PmsConstant.ROLE_EMPLOYEE:
			return null;
		case PmsConstant.ROLE_PROVIDER:
			return null;
		}

		return null;
	}
	
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

}
