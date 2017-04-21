package com.panfeng.web.wearable.resource.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.google.gson.Gson;
import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.enums.LoginType;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.right.entity.PmsRole;
import com.paipianwang.pat.facade.right.service.PmsRightFacade;
import com.paipianwang.pat.facade.right.service.PmsRoleFacade;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.paipianwang.pat.facade.user.service.PmsUserFacade;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.mq.service.SmsMQService;
import com.panfeng.web.wearable.resource.model.Info;
import com.panfeng.web.wearable.security.AESUtil;
import com.panfeng.web.wearable.service.SmsService;
import com.panfeng.web.wearable.util.DataUtil;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

/**
 * 登陆事件 控制器
 * 
 * @author Jack
 */
@RestController
@RequestMapping("/login")
public class LoginController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log

	final Logger logger = LoggerFactory.getLogger("error");

	@Autowired
	private SmsService smsService = null;
	
	@Autowired
	private final SmsMQService smsMQService = null;

	@Autowired
	private Producer captchaProducer = null;
	
	@Autowired
	private final PmsUserFacade pmsUserFacade = null;

	@Autowired
	private final PmsRoleFacade pmsRoleFacade = null;

	@Autowired
	private final PmsRightFacade pmsRightFacade = null;

	/**
	 * 验证登录操作
	 * 
	 * @return 是否成功
	 */
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Info login(@RequestBody final PmsUser user, final HttpServletRequest request) {
		if (user.getLoginType().equals(LoginType.PHONE.getDesc())) {// 手机号登录
			return loginByPhone(user,request);
		} else {// 用户名登录
			return loginByName(user,request);
		}
	}
	
	private Info loginByName(PmsUser user, HttpServletRequest request) {
		final String pwd = user.getPassword();
		final String loginName = user.getLoginName();
		if (ValidateUtil.isValid(loginName) && ValidateUtil.isValid(pwd)) {
			try {
				String password = AESUtil.Decrypt(pwd, PmsConstant.UNIQUE_KEY);
				user.setPassword(DataUtil.md5(password));
				PmsUser orignUser = pmsUserFacade.findUserByLoginNameAndPwd(user);
				if(null != orignUser){
					initSessionInfo(orignUser, request);
					return new Info(true, "登录成功");
				}else{
					return new Info(false, "帐户名或密码错误");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new Info(false,"数据错误");
	}

	private Info loginByPhone(PmsUser user, HttpServletRequest request) {
		final String code = (String) request.getSession().getAttribute("code");
		final String codeOfphone = (String) request.getSession().getAttribute("codeOfphone");
		if ((!"".equals(code) && code != null)) {
			if (code.equals(user.getVerification_code())) {
				if (null != codeOfphone && codeOfphone.equals(user.getTelephone())) {
					PmsUser orignUser = pmsUserFacade.findUserByAttr(user);
					if (orignUser != null) {
						// 清空当前session
						initSessionInfo(orignUser, request);
						return new Info(true, "登录成功");
					}else{
						return new Info(false, "手机号或密码错误");
					}
				} else {
					return new Info(false, "和验证手机不符!");
				}
			} else {
				return new Info(false, "验证码输入错误!");
			}
		} else {
			return new Info(false, "请重新获取验证码!");
		}
	}

	/**
	 * 验证手机号码是否注册
	 */
	@RequestMapping("/validation/phone")
	public BaseMsg validation(@RequestBody final PmsUser user, final ModelMap model, final HttpServletRequest request) {
		final int count = pmsUserFacade.validationPhone(user.getTelephone(), null);
		if (count > 0) { // 被注册
			serLogger.info("validation telephone " + user.getTelephone() + " can't register,Becase it is exist ...");
			return new BaseMsg(BaseMsg.NORMAL, "", null);
		} else if (count <= 0) { // 未被注册
			serLogger.info("validation telephone " + user.getTelephone() + " can register,Becase it is not exist ...");
			return new BaseMsg(BaseMsg.WARNING, "", null);
		}
		return new BaseMsg(BaseMsg.ERROR, "服务器通信失败请稍后重试！", null);
	}

	/**
	 * 验证手机号码是否注册
	 */
	@RequestMapping("/validation/userName")
	public boolean validationUserName(@RequestBody Map<String, String> loginName, final ModelMap model,
			final HttpServletRequest request) {
		String userName_key = "loginName";
		final int count = pmsUserFacade.validationPhone(null, loginName.get("loginName"));
		if (count > 0) { // 被注册
			serLogger.info(
					"validation telephone " + loginName.get(userName_key) + " can't register,Becase it is exist ...");
			return true;
		} else if (count <= 0) { // 未被注册
			serLogger.info(
					"validation telephone " + loginName.get(userName_key) + " can register,Becase it is not exist ...");
			return false;
		}
		return false;
	}

	/**
	 * 注册
	 */
	@RequestMapping("/register")
	public Info register(final HttpServletRequest request, @RequestBody final PmsUser user, final ModelMap model)
			throws Exception {

		final HttpSession session = request.getSession();
		final String code = (String) request.getSession().getAttribute("code");
		final String codeOfphone = (String) request.getSession().getAttribute("codeOfphone");
		Info info = new Info(); // 信息载体
		// 是否是测试程序
		boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
		// 判断验证码
		if (isTest || (!"".equals(code) && code != null)) {
			if (isTest || code.equals(user.getVerification_code())) {
				if (isTest || (null != codeOfphone && codeOfphone.equals(user.getTelephone()))) {
					if (user.getPassword() != null && !"".equals(user.getPassword())) {
						// AES 密码解密
						final String password = AESUtil.Decrypt(user.getPassword(), PmsConstant.UNIQUE_KEY);
						// MD5加密
						user.setPassword(DataUtil.md5(password));
						session.removeAttribute("code"); // 移除验证码

						PmsUser pmsUser = pmsUserFacade.register(user);
						if(pmsUser != null){
							if(pmsUser.getUserId() > 0 ){
								smsMQService.sendMessage("132269", user.getTelephone(), null);
								Gson gson = new Gson();
								String json = gson.toJson(pmsUser);
								final boolean ret = initSessionInfo(gson.fromJson(json, PmsUser.class), request);
								info.setKey(ret);
								if (!ret) {
									// 注册失败
									info.setValue("服务器繁忙，请稍候再试...");
								}
								return info;
							}else if(pmsUser.getUserId() < 0 ){
								info.setKey(false);
								info.setValue("手机已经备注册！");
							}
						}else{
							info.setKey(false);
							info.setValue("注册失败！");
						}
						return info;
					} else {
						// 验证码不匹配
						info.setKey(false);
						info.setValue("密码为空!");
						serLogger.info(
								"Register PmsUser " + user.getUserName() + " failure ,Becase password is empty ...");
						return info;
					}
				} else {
					// 手机号错误
					info.setKey(false);
					info.setValue("手机号不正确!");
					return info;
				}
			} else {
				// 验证码不匹配
				info.setKey(false);
				info.setValue("短信验证码不正确!");

				serLogger.info("Register PmsUser " + user.getUserName() + " failure ,Becase sms code not equal ...");
				return info;
			}
		} else {
			// 验证码为空
			info.setKey(false);
			info.setValue("点击获取验证码!");

			serLogger.info("Register PmsUser " + user.getUserName() + " failure ,Becase sms code is null ...");
			return info;
		}
	}

	/**
	 * 发送验证码
	 */
	@RequestMapping("/verification/{telephone}")
	public boolean verification(final HttpServletRequest request, @PathVariable("telephone") final String telephone) {
		boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
		final String code = DataUtil.random(true, 6);
		request.getSession().setAttribute("code", code); // 存放验证码
		request.getSession().setAttribute("codeOfphone", telephone); // 存放手机号
		if (!isTest) {
			final boolean ret = smsService.smsSend(PublicConfig.SMS_VERIFICATION_CODE, telephone,
					new String[] { code, PublicConfig.SMS_CODE_DURATION + "分钟" });
			serLogger.error("Send sms code " + code + " to telephone " + telephone);
			return ret;
		}
		return true;
	}

	/**
	 * 清除session中的验证码
	 */
	@RequestMapping("/clear/code")
	public int clearCode(final HttpServletRequest request) {
		request.getSession().removeAttribute("code");
		return 0;
	}

	/**
	 * kaptcha 生成 图片验证码
	 */
	@RequestMapping("/kaptcha.png")
	public ModelAndView getKaptchaImage(final HttpServletRequest request, final HttpServletResponse response) {
		final HttpSession session = request.getSession();

		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate,max-age=0");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");

		final String kaptchaCode = captchaProducer.createText();
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, kaptchaCode);
		ServletOutputStream out = null;
		try {
			BufferedImage bi = captchaProducer.createImage(kaptchaCode);
			out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
			out.flush();
			serLogger.info("create kaptcha code is " + kaptchaCode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("LoginController method:getKaptchaImage() Create Kaptcha error ...");
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 图片验证码对比事件
	 */
	@RequestMapping("/kaptcha/compare/{kaptcha_code}")
	public Info compare(final HttpServletRequest request, @PathVariable("kaptcha_code") final String kaptcha_code) {

		final Info info = new Info();
		// 是否是测试程序
		boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
		if (kaptcha_code != null && !"".equals(kaptcha_code)) {
			final String kaptchaCode = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if (kaptchaCode != null && !"".equals(kaptcha_code)) {
				if (isTest || kaptchaCode.equalsIgnoreCase(kaptcha_code)) {
					info.setKey(true);
					serLogger.info("kaptcha code equal input code ...");
				} else {
					// 验证码 不一致
					info.setKey(false);
					info.setValue("图片验证码输入错误!");
					serLogger.info("kaptcha code not equal input code ...");
				}
			} else {
				// session 过时
				info.setKey(false);
				info.setValue("点击图片获取验证码!");
				serLogger.info("kaptcha code in session is past due ...");
			}
		} else {
			// 图片验证码 为空
			info.setKey(false);
			info.setValue("请输入图片验证码!");
			serLogger.info("input code is empty ...");
		}
		return info;
	}

	@RequestMapping("/modify/logName2")
	public BaseMsg modifyLogNameNoMsgAuth(final HttpServletRequest request, @RequestBody final PmsUser user) {
		if (user != null && ValidateUtil.isValid(user.getPassword()) && ValidateUtil.isValid(user.getLoginName())) {
			try {
				// AES 密码解密
				final String password = AESUtil.Decrypt(user.getPassword(), PmsConstant.UNIQUE_KEY);
				// MD5 加密
				user.setPassword(DataUtil.md5(password));
				final String url = PublicConfig.URL_PREFIX + "portal/user/modify/loginName";
				String str = HttpUtil.httpPost(url, user, request);
				if (str != null && !"".equals(str)) {
					boolean result = JsonUtil.toBean(str, Boolean.class);
					// 添加 session
					return new BaseMsg(BaseMsg.NORMAL, "请求正常", result);
				} else {
					return new BaseMsg(BaseMsg.ERROR, "服务器繁忙，请稍候再试...", false);
				}
			} catch (Exception e) {
				e.printStackTrace();
				return new BaseMsg(BaseMsg.ERROR, "登陆错误，请重试！", false);
			}
		} else {
			return new BaseMsg(BaseMsg.ERROR, "密码或用户名不完整！", false);
		}
	}

	/**
	 * 退出登录到登录页
	 */
	@RequestMapping("/loginout")
	public ModelAndView loginout(final HttpServletRequest request) {

		request.getSession().removeAttribute(PmsConstant.SESSION_INFO);
		return new ModelAndView("redirect:/");
	}

	/**
	 * 退出登录首页
	 */
	@RequestMapping("/mgr/loginout")
	public ModelAndView mgrLoginout(final HttpServletRequest request) {

		request.getSession().removeAttribute(PmsConstant.SESSION_INFO);
		return new ModelAndView("redirect:/");
	}

	/**
	 * 初始化 sessionInfo 信息
	 * 
	 * @param user
	 * @param request
	 * @return
	 */
	public boolean initSessionInfo(final PmsUser user, HttpServletRequest request) {
		final HttpSession session = request.getSession();

		// 清空session
		session.removeAttribute(PmsConstant.SESSION_INFO);

		// 存入session中
		final SessionInfo info = new SessionInfo();
		info.setLoginName(user.getLoginName());
		info.setRealName(user.getRealName());
		info.setSessionType(PmsConstant.ROLE_CUSTOMER);
		// info.setSuperAdmin(false);
		info.setToken(DataUtil.md5(session.getId()));
		info.setReqiureId(user.getId());
		info.setClientLevel(user.getClientLevel()); // 客户级别
		info.setTelephone(user.getTelephone());

		final PmsRole role = pmsRoleFacade.findRoleById(3l); // 获取用户角色
		final List<PmsRole> roles = new ArrayList<PmsRole>();
		roles.add(role);
		user.setRoles(roles);
		// 计算权限码总和
		final long maxPos = pmsRightFacade.getMaxPos();
		final long[] rightSum = new long[(int) (maxPos + 1)];
		user.setRightSum(rightSum);
		user.calculateRightSum();
		info.setSum(user.getRightSum());
		info.setEmail(user.getEmail());
		info.setPhoto(user.getImgUrl());
		info.setSuperAdmin(user.isSuperAdmin()); // 判断是否是超级管理员

		session.setAttribute(PmsConstant.SESSION_INFO, info);
		return true;
	}
}