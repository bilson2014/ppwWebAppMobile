package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.enums.LoginType;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.right.entity.PmsRole;
import com.paipianwang.pat.facade.right.service.PmsRightFacade;
import com.paipianwang.pat.facade.right.service.PmsRoleFacade;
import com.paipianwang.pat.facade.team.entity.PmsCity;
import com.paipianwang.pat.facade.team.entity.PmsProvince;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.paipianwang.pat.facade.team.service.PmsCityFacade;
import com.paipianwang.pat.facade.team.service.PmsProvinceFacade;
import com.paipianwang.pat.facade.team.service.PmsTeamFacade;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.mq.service.SmsMQService;
import com.panfeng.web.wearable.resource.model.Info;
import com.panfeng.web.wearable.resource.model.Wechat;
import com.panfeng.web.wearable.security.AESUtil;
import com.panfeng.web.wearable.service.ProviderThirdLogin;
import com.panfeng.web.wearable.util.DataUtil;
import com.panfeng.web.wearable.util.FileUtils;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;
import com.panfeng.web.wearable.util.WechatUtils;

/**
 * 供应商模块 控制器
 * 
 * @author Jack
 *
 */
@RestController
@RequestMapping("/provider")
public class ProviderController extends BaseController {

	final Logger logger = LoggerFactory.getLogger("error");

	final Logger serLogger = LoggerFactory.getLogger("service");

	@Autowired
	private ProviderThirdLogin providerThirdLogin;

	@Autowired
	private final PmsTeamFacade pmsTeamFacade = null;

	@Autowired
	private final PmsProductFacade pmsProductFacade = null;

	@Autowired
	private final PmsRoleFacade pmsRoleFacade = null;

	@Autowired
	private final PmsRightFacade pmsRightFacade = null;

	@Autowired
	private final PmsProvinceFacade pmsProvinceFacade = null;

	@Autowired
	private final PmsCityFacade pmsCityFacade = null;
	
	@Autowired
	private final SmsMQService smsMQService = null;

	static String UNIQUE = "unique_s"; // 三方登录凭证
	static String LINKMAN = "username_s";// 用户名
	static String ORIGINAL = "original";// 源对象
	static String TYPE = "type_s";// 当前处理任务类型，（注册）
	static String LTYPE = "ltype_s"; // 三方登录类型

	static String REGISTER_KET = "register";

	// 手机端项目主页
	@RequestMapping("/index")
	public ModelAndView goToIndex(ModelMap modelMap, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		modelMap.put("userInfo", sessionInfo);
		return new ModelAndView("/project", modelMap);
	}

	/**
	 * 登录
	 * 
	 * @param original
	 *            登陆信息
	 * @return 登陆:true,失败:false
	 */
	@RequestMapping("/doLogin")
	public BaseMsg login(@RequestBody final PmsTeam original, final HttpServletRequest request) {
		if (original == null) {
			return new BaseMsg(BaseMsg.ERROR, "登陆错误", false);
		}
		if (original.getLoginType().equals(LoginType.PHONE.getDesc())) {// 手机号登录
			return loginByPhone(original, request);
		} else {// 用户名登录
			return loginByName(original, request);
		}
	}
	
	private BaseMsg loginByName(PmsTeam original, HttpServletRequest request) {
		final String pwd = original.getPassword();
		final String loginName = original.getLoginName();
		if (ValidateUtil.isValid(loginName) && ValidateUtil.isValid(pwd)) {
			try {// 解密
				final String password = AESUtil.Decrypt(pwd, PmsConstant.UNIQUE_KEY);
				original.setPassword(DataUtil.md5(password));
				PmsTeam team = pmsTeamFacade.findTeamByLoginNameAndPwd(original);
				if (team != null) {
					// 存入session
					boolean ret = initSessionInfo(team, request);
					if (ret) {
						return new BaseMsg(BaseMsg.NORMAL, "", true);
					} else {
						return new BaseMsg(BaseMsg.ERROR, "用户名或密码错误!", false);
					}
				} else {
					return new BaseMsg(BaseMsg.WARNING, "用户名或密码错误!", false);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new BaseMsg(BaseMsg.ERROR, "登陆错误", false);
	}

	private BaseMsg loginByPhone(final PmsTeam original, final HttpServletRequest request) {
		final String code = (String) request.getSession().getAttribute("code");
		final String codeOfphone = (String) request.getSession().getAttribute("codeOfphone");
		if ((original.getVerification_code() != null && code != null)) {
			if (code.equals(original.getVerification_code())) {
				if ((null != codeOfphone && codeOfphone.equals(original.getPhoneNumber()))) {
					PmsTeam team = pmsTeamFacade.doLogin(original.getPhoneNumber());
					if (team != null) {
						// 存入session
						boolean ret = initSessionInfo(team, request);
						if (ret) {
							return new BaseMsg(BaseMsg.NORMAL, "", true);
						} else {
							return new BaseMsg(BaseMsg.WARNING, "手机号或密码错误!", false);
						}
					} else {
						return new BaseMsg(BaseMsg.WARNING, "手机号或密码错误!", false);
					}
				} else {
					return new BaseMsg(BaseMsg.ERROR, "和验证手机不符", false);
				}
			} else {
				return new BaseMsg(BaseMsg.ERROR, "验证码错误", false);
			}
		} else {
			return new BaseMsg(BaseMsg.ERROR, "请重新获取验证码", false);
		}
	}

	@RequestMapping("/thirdLogin")
	public ModelAndView thirdLogin(String json, final HttpServletRequest request, ModelMap modelMap) {
		if (!ValidateUtil.isValid(json))
			return new ModelAndView("/provider/login");
		PmsTeam original = JsonUtil.toBean(json, PmsTeam.class);
		boolean isBind = providerThirdLogin.login(original, request);
		if (isBind) {
			return new ModelAndView("/provider/portal");
		} else {
			HttpSession httpSession = request.getSession();
			String unique = "";
			switch (original.getThirdLoginType()) {
			case PmsTeam.LTYPE_QQ:
				unique = original.getQqUnique();
				break;
			case PmsTeam.LTYPE_WECHAT:
				unique = original.getWechatUnique();
				break;
			case PmsTeam.LTYPE_WEIBO:
				unique = original.getWbUnique();
				break;
			}
			httpSession.setAttribute(UNIQUE, unique);
			httpSession.setAttribute(LINKMAN, original.getLinkman());
			httpSession.setAttribute(LTYPE, original.getThirdLoginType());
			modelMap.put("linkMan", original.getLinkman());
			modelMap.put("LType", original.getThirdLoginType());
			return new ModelAndView("/provider/threeLogin", modelMap);
		}
	}

	/**
	 * 供应商系统登出操作
	 * 
	 * @return 供应商系统登录页面
	 */
	@RequestMapping("/loginout")
	public ModelAndView loginOut(final HttpServletRequest request) {
		request.getSession().removeAttribute(PmsConstant.SESSION_INFO);
		return new ModelAndView("redirect:/");
	}

	/**
	 * 检测登录名是否可用
	 * 
	 * @param phoneNumber
	 *            注册的手机号码
	 * @return 标识可以注册，返回true;标识已注册，返回false
	 */
	@RequestMapping("/checkExisting")
	public boolean isExisting(@RequestBody final PmsTeam team, final HttpServletRequest request) {
		final long count = pmsTeamFacade.checkExist(team);
		return count > 0 ? false : true;
	}

	/**
	 * 检测登录名是否可用
	 * 
	 * @param phoneNumber
	 *            注册的手机号码
	 * @return 
	 */
	@RequestMapping("/checkPhoneExisting")
	public BaseMsg phoneIsExisting(@RequestBody final PmsTeam team, final HttpServletRequest request) {

		final long count = pmsTeamFacade.checkExist(team);
		if (count <= 0) {
			return new BaseMsg(BaseMsg.NORMAL, "", null); // 未被注册
		} else {
			return new BaseMsg(BaseMsg.WARNING, "手机号已经重复注册啦！", null); // 已经注册
		}
	}

	/**
	 * 注册
	 * 
	 * @param original
	 *            供应商信息
	 * @return 成功返回 true, 失败返回 false
	 */
	@RequestMapping("/info/register")
	public Info register(@RequestBody final PmsTeam original, final HttpServletRequest request) {
		final String code = (String) request.getSession().getAttribute("code");
		final String codeOfphone = (String) request.getSession().getAttribute("codeOfphone");
		// 是否是测试程序
		boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
		Info info = new Info(); // 信息载体
		// 判断验证码
		if (isTest || (!"".equals(code) && code != null)) {
			if (isTest || code.equals(original.getVerification_code())) {
				if (isTest || (null != codeOfphone && codeOfphone.equals(original.getPhoneNumber()))) {
					if (original != null && original.getPassword() != null && !"".equals(original.getPassword())) {
						HttpSession httpSession = request.getSession();
						Gson gson = new Gson();
						String json = gson.toJson(original);
						httpSession.setAttribute(ORIGINAL, json); // session
																	// 内不能存储对象，存储json字符串
						httpSession.setAttribute(TYPE, REGISTER_KET);
						info.setKey(true);
						return info;
					}
				} else {
					// 手机号错误
					info.setKey(false);
					info.setValue("手机号不正确!");
				}
			} else {
				// 验证码过期
				info.setKey(false);
				info.setValue("验证码输入错误!");
			}
		} else {
			// session 过期
			info.setKey(false);
			info.setValue("请重新获取验证码!");
		}

		return info;
	}

	/**
	 * 更新供应商基本信息
	 * 
	 * @param team
	 *            团队信息(供应商名称、简介、地址、邮箱等)
	 * @return 成功返回 true, 失败返回 false
	 */
	@RequestMapping("/update/teamInfomation")
	public boolean updateTeamInformation(final HttpServletRequest request, @RequestBody final PmsTeam team) {

		if (team != null) {
			try {
				return updateInfo(team, request);
			} catch (UnsupportedEncodingException e) {
				logger.error(
						"ProviderController method:updateTeamInformation() Privder infomartion encode error On updateTeamInformation Method ...");
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * 供应商注册引导页信息保存
	 * 
	 * @param team
	 *            团队信息(供应商名称、简介、地址、邮箱等)
	 * @return 成功返回 true, 失败返回 false
	 */

	@RequestMapping("/update/leaderInfomation")
	public Long leadUserupdateInformation(final HttpServletRequest request, @RequestBody final PmsTeam team) {
		if (team != null) {
			final Long ret = updateInfo_register(team, request);
			if(ret > 0) 
				return ret;
		}
		return -1L;
	}

	/**
	 * 检验密码是否正确
	 * 
	 * @param original
	 *            包含(登录名和密码)
	 */
	@RequestMapping("/validateLoginStatus")
	public Info validateLogin(@RequestBody final PmsTeam original, final HttpServletRequest request) {

		Info info = new Info();
		if (original != null && original.getPassword() != null && !"".equals(original.getPassword())
				&& original.getLoginName() != null && !"".equals(original.getLoginName())) {
			try {
				// AES 解密
				final String password = AESUtil.Decrypt(original.getPassword(), PmsConstant.UNIQUE_KEY);

				// MD5 加密
				original.setPassword(DataUtil.md5(password));

				// 登录远程服务器进行比对
				final PmsTeam team = pmsTeamFacade.findTeamByLoginNameAndPwd(original);
				if (team != null) {
					info.setKey(true);
					return info;
				} else {
					info.setKey(false);
					info.setValue("密码输入错误!");
					return info;
				}
			} catch (Exception e) {
				logger.error(
						"ProviderController method:validateLogin() Provider Password Decrypt Error On Provider CheckLoginStatus ...");
				e.printStackTrace();
			}

		} else {
			serLogger.info("Provider Is Null On Provider CheckLoginStatus ...");
			info.setKey(false);
			info.setValue("密码不能为空!");
			return info;
		}
		info.setKey(false);
		return info;
	}

	/**
	 * 供应商信息界面-修改密码
	 * 
	 * @param original
	 *            包含(登录名和密码)
	 */
	@RequestMapping("/recover/password")
	public BaseMsg updatePasswordByLoginName(@RequestBody final PmsTeam team, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg(0, "信息修改失败，请刷新后再试!");
		final String code = (String) request.getSession().getAttribute("code");
		// 是否是测试程序
		boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
		if (isTest || (!"".equals(code) && code != null)) {
			if (isTest || (code.equals(team.getVerification_code()))) {
				if (team != null && team.getPassword() != null && !"".equals(team.getPassword())
						&& team.getLoginName() != null && !"".equals(team.getLoginName())) {
					try {
						// AES 解密
						final String password = AESUtil.Decrypt(team.getPassword(), PmsConstant.UNIQUE_KEY);

						// MD5 加密
						team.setPassword(DataUtil.md5(password));

						// 连接远程服务器，传输数据
						final long ret = pmsTeamFacade.updatePasswordByLoginName(team);
						getCurrentInfo(request);
						if (ret > 0) {
							msg.setCode(1);
							msg.setResult("修改成功");
						}
					} catch (Exception e) {
						logger.error(
								"ProviderController method:updatePasswordByLoginName() Provider Password Decrypt Error On Provider Register ...");
						e.printStackTrace();
					}
				}
			} else {
				msg.setResult("验证码错误");
			}
		}
		return msg;
	}

	/**
	 * 带有短信验证的供应商用户名密码注册
	 * 
	 * @param request
	 * @param team
	 * @return
	 */
	@RequestMapping("/add/account")
	public BaseMsg addAccount(final HttpServletRequest request, @RequestBody final PmsTeam team) {
		BaseMsg msg = new BaseMsg(0, "信息修改失败，请刷新后再试!");
		final String code = (String) request.getSession().getAttribute("code");
		// 是否是测试程序
		boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
		if (isTest || (!"".equals(code) && code != null)) {
			if (isTest || (code.equals(team.getVerification_code()))) {
				if (team != null) {
					try {
						String password = AESUtil.Decrypt(team.getPassword(), PmsConstant.UNIQUE_KEY);
						team.setPassword(DataUtil.md5(password));
					} catch (Exception e) {
						e.printStackTrace();
					}

					SessionInfo sessionInfo = getCurrentInfo(request);
					if (null != sessionInfo) {
						team.setTeamId(sessionInfo.getReqiureId());
					}
					long count = pmsTeamFacade.updateTeamAccount(team);
					if (count >= 0) {
						PmsTeam t = pmsTeamFacade.findTeamById(team.getTeamId());
						Gson gson = new Gson();
						String json = gson.toJson(t);
						request.getSession().removeAttribute(PmsConstant.SESSION_INFO);
						final boolean ret = initSessionInfo(gson.fromJson(json, PmsTeam.class), request);
						if (ret) {
							msg.setCode(1);
							msg.setResult("修改成功");
						}
					}

				}
			} else
				msg.setResult("验证码错误");
		}
		return msg;
	}

	/**
	 * 不带有短信验证的供应商用户名密码注册
	 * 
	 * @param request
	 * @param team
	 * @return
	 */
	@RequestMapping("/add/account2")
	public BaseMsg addAccountNoMsgAuth(final HttpServletRequest request, @RequestBody final PmsTeam team) {
		BaseMsg msg = new BaseMsg(0, "信息修改失败，请刷新后再试!");
		if (team != null) {
			try {
				String password = AESUtil.Decrypt(team.getPassword(), PmsConstant.UNIQUE_KEY);
				team.setPassword(DataUtil.md5(password));
			} catch (Exception e) {
				e.printStackTrace();
			}

			SessionInfo sessionInfo = getCurrentInfo(request);
			if (null != sessionInfo) {
				team.setTeamId(sessionInfo.getReqiureId());
			}
			long count = pmsTeamFacade.updateTeamAccount(team);
			if (count >= 0) {
				PmsTeam t = pmsTeamFacade.findTeamById(team.getTeamId());
				Gson gson = new Gson();
				String json = gson.toJson(t);
				request.getSession().removeAttribute(PmsConstant.SESSION_INFO);
				final boolean ret = initSessionInfo(gson.fromJson(json, PmsTeam.class), request);
				if (ret) {
					msg.setCode(1);
					msg.setResult("修改成功");
				}
			}

		}
		return msg;
	}

	// 跳转至 上传页面
	@RequestMapping("/product/{action}/{providerId}/{productId}")
	public ModelAndView productView(@PathVariable("action") final String action,
			@PathVariable("providerId") final long providerId, @PathVariable("productId") final long productId,
			final ModelMap model, final HttpServletRequest request) {

		PmsProduct product = new PmsProduct();
		if (productId != 0 && "modify".equals(action)) {
			// 修改
			final String url = PublicConfig.URL_PREFIX + "portal/product/static/data/" + productId;
			final String json = HttpUtil.httpGet(url, request);
			if (json != null && !"".equals(json)) {
				product = JsonUtil.toBean(json, PmsProduct.class);
				String sid = product.getSessionId();
				if (sid == null || "".equals(sid))
					product.setSessionId(DataUtil.getUuid());
			}
		}
		model.addAttribute("cKey", providerId);
		model.addAttribute("productKey", productId);
		model.addAttribute("action", action);
		model.addAttribute("sId", product.getServiceId());
		model.addAttribute("model", product);
		return new ModelAndView("provider/upload", model);
	}

	/**
	 * 根据ID获取产品
	 * 
	 * @param productId
	 *            视频唯一标识
	 * @return 视频信息
	 */
	@RequestMapping("/product/data/{productId}")
	public PmsProduct loadProductById(final HttpServletRequest request, @PathVariable("productId") long productId) {
		// 如果 传来的ID值为-1，说明是 保存操作，从session中取值
		final String url = PublicConfig.URL_PREFIX + "portal/product/static/data/" + productId;
		final String json = HttpUtil.httpGet(url, request);
		PmsProduct product = new PmsProduct();
		if (json != null && !"".equals(json)) {
			product = JsonUtil.toBean(json, PmsProduct.class);
		}
		return product;
	}

	/**
	 * 获取唯一视频
	 * 
	 * @param providerId
	 *            供应商唯一编号
	 * @return 视频编号
	 */
	@RequestMapping("/loadVideo/{providerId}")
	public long loadProductByProviderId(@PathVariable("providerId") final long providerId,
			final HttpServletRequest request) {

		final String url = PublicConfig.URL_PREFIX + "portal/product/static/data/loadSingleProduct/" + providerId;
		final String json = HttpUtil.httpGet(url, request);
		long productId = 0l;
		if (json != null && !"".equals(json)) {
			productId = JsonUtil.toBean(json, Long.class);
		}
		return productId;
	}

	// 检查文件是否符合规范
	public String checkFile(final MultipartFile file) {
		if (file != null && !file.isEmpty()) {
			final long img_MaxSize = Long.parseLong(PublicConfig.PRODUCT_IMAGE_MAX_SIZE);
			final long video_MaxSize = Long.parseLong(PublicConfig.VIDEO_MAX_SIZE);

			// 检测文件类型
			final String extName = FileUtils.getExtName(file.getOriginalFilename(), ".");
			final short fileType = FileUtils.divideIntoGroup(extName, PublicConfig.ALLOW_IMAGE_TYPE,
					PublicConfig.ALLOW_VIDEO_TYPE);
			final long fileSize = file.getSize();
			switch (fileType) {
			case 0: // video
				// 检查视频大小
				if (fileSize > video_MaxSize * 1024 * 1024) {

					// 视频文件超过500M上限
					return "false@error=1";
				}
				break;
			case 1: // image
				// 检查图片大小
				if (fileSize > img_MaxSize * 1024) {

					// 图片文件超过250K上限
					return "false@error=2";
				}
				break;
			case 2: // other
				throw new RuntimeException("file type error ...");
			}
			return "success";
		}
		return "false@error3";
	}

	@RequestMapping("/bind")
	public BaseMsg bind(@RequestBody final PmsTeam team, final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		final String phone = team.getPhoneNumber();
		final String Ltype = team.getThirdLoginType();
		final Object objUnique = httpSession.getAttribute(UNIQUE);
		final Object objLinkman = httpSession.getAttribute(LINKMAN);
		final Object objCode = request.getSession().getAttribute("code");
		if (ValidateUtil.isValid(phone) && ValidateUtil.isValid(Ltype) && objUnique != null && objCode != null) {
			// 不需要输入验证码
			try {
				final String Unique = (String) objUnique;
				final String Linkman = (String) objLinkman;
				final String code = (String) objCode;

				// 不需要输入验证码 code == null dev code != null
				if (code != null && code.equals(team.getVerification_code())) {
					team.setLinkman(Linkman);
					if (ValidateUtil.isValid(Unique)) {
						switch (Ltype) {
						case PmsTeam.LTYPE_QQ:
							team.setQqUnique(Unique);
							break;
						case PmsTeam.LTYPE_WECHAT:
							team.setWechatUnique(Unique);
							break;
						case PmsTeam.LTYPE_WEIBO:
							team.setWbUnique(Unique);
							break;
						}
						// 后台绑定
						final String url = PublicConfig.URL_PREFIX + "portal/team/thirdLogin/bind";
						final String json = HttpUtil.httpPost(url, team, request);
						if (ValidateUtil.isValid(json)) {
							final BaseMsg msg = JsonUtil.toBean(json, BaseMsg.class);
							if (msg.getErrorCode().equals(BaseMsg.NORMAL)) {
								// 删除 session
								httpSession.removeAttribute(UNIQUE);
								httpSession.removeAttribute(LINKMAN);
							} else if (msg.getErrorCode().equals(BaseMsg.WARNING)) {
								// 进入引导页
								Gson gson = new Gson();
								String str = gson.toJson(msg.getResult());
								httpSession.setAttribute(ORIGINAL, str); // session
																			// 内不能存储对象，存储json字符串
								httpSession.setAttribute(TYPE, REGISTER_KET);
							}
							return msg;
						}
					}
				}
			} catch (Exception e) {
				logger.error("Provider bind error,teamName is " + team.getLoginName());
				e.printStackTrace();
			}
		}
		logger.error("信息不完整");
		return new BaseMsg(BaseMsg.ERROR, "信息不完整", null);
	}

	@RequestMapping("/leader")
	public ModelAndView leader(final HttpServletRequest request, final ModelMap model) throws Exception {

		List<PmsProvince> list = pmsProvinceFacade.getAll();
		if (ValidateUtil.isValid(list)) {
			model.addAttribute("provinces", list);
			List<PmsCity> citys = pmsCityFacade.findCitysByProvinceId(list.get(0).getProvinceID());
			model.addAttribute("citys", citys);
		}

		HttpSession httpSession = request.getSession();
		Object object = httpSession.getAttribute(ORIGINAL);
		if (object != null) {
			return new ModelAndView("provider/providerInfoLeader");
		} else {
			return new ModelAndView("error");
		}
	}

	public PmsTeam getCurrentTeam(final HttpServletRequest request) {
		final SessionInfo info = getCurrentInfo(request);
		if (info != null) {
			final PmsTeam team = pmsTeamFacade.findTeamById(info.getReqiureId());
			team.setPassword(null);
			return team;
		}
		return null;
	}

	public boolean updateInfo(final PmsTeam team, final HttpServletRequest request)
			throws UnsupportedEncodingException {
		// 转码
		final String teamName = team.getTeamName();
		final String teamDesc = team.getTeamDescription();
		final String address = team.getAddress();
		final String email = team.getEmail();
		final String linkman = team.getLinkman();
		final String webchat = team.getWebchat();
		final String officialSite = team.getOfficialSite();
		final String scale = team.getScale();
		final String businessDesc = team.getBusinessDesc();
		final String demand = team.getDemand();
		final String description = team.getDescription();

		if (teamName != null && !"".equals(teamName)) {
			team.setTeamName(URLEncoder.encode(teamName, "UTF-8"));
		}

		if (teamDesc != null && !"".equals(teamDesc)) {
			team.setTeamDescription(URLEncoder.encode(teamDesc, "UTF-8"));
		}

		if (address != null && !"".equals(address)) {
			team.setAddress(URLEncoder.encode(address, "UTF-8"));
		}

		if (email != null && !"".equals(email)) {
			team.setEmail(URLEncoder.encode(email, "UTF-8"));
		}

		if (linkman != null && !"".equals(linkman)) {
			team.setLinkman(URLEncoder.encode(linkman, "UTF-8"));
		}

		if (webchat != null && !"".equals(webchat)) {
			team.setWebchat(URLEncoder.encode(webchat, "UTF-8"));
		}

		if (officialSite != null && !"".equals(officialSite)) {
			team.setOfficialSite(URLEncoder.encode(officialSite, "UTF-8"));
		}

		if (scale != null && !"".equals(scale)) {
			team.setScale(URLEncoder.encode(scale, "UTF-8"));
		}

		if (businessDesc != null && !"".equals(businessDesc)) {
			team.setBusinessDesc(URLEncoder.encode(businessDesc, "UTF-8"));
		}

		if (demand != null && !"".equals(demand)) {
			team.setDemand(URLEncoder.encode(demand, "UTF-8"));
		}

		if (description != null && !"".equals(description)) {
			team.setDescription(URLEncoder.encode(description, "UTF-8"));
		}

		final String updateUrl = PublicConfig.URL_PREFIX + "portal/team/static/data/updateTeamInformation";
		final String json = HttpUtil.httpPost(updateUrl, team, request);
		final boolean flag = JsonUtil.toBean(json, Boolean.class);
		return flag;
	}

	@RequestMapping("/wechat/callback.do")
	public ModelAndView loginWithWeChat(@RequestParam("code") String code, final HttpServletRequest request,
			ModelMap modelMap) {
		Wechat wechat = WechatUtils.decodeWechatToken(code, request);
		SessionInfo sessionInfo = getCurrentInfo(request);
		if (wechat == null)
			return new ModelAndView("/provider/threeLogin");
		PmsTeam original = new PmsTeam();
		if (null != sessionInfo && ValidateUtil.isValid(sessionInfo.getReqiureId())) {// 用户已经登录,个人资料页绑定
			original.setUniqueId(wechat.getUnionid());
			original.setThirdLoginType(PmsTeam.LTYPE_WECHAT);
			original.setTeamId(sessionInfo.getReqiureId());
			final String url = PublicConfig.URL_PREFIX + "portal/team/info/bind";
			String s = HttpUtil.httpPost(url, original, request);
			Boolean b = JsonUtil.toBean(s, Boolean.class);
			if (b) {
				modelMap.addAttribute("msg", "绑定成功");// 返回页面用作提示绑定成功
			} else
				modelMap.addAttribute("msg", "该账号已经存在绑定");
			return new ModelAndView("redirect:/provider/portal");
		} else {
			original.setLinkman(wechat.getNickname());
			// 这个是微信的唯一标识么?唯一标识不是token.getOpenid吗? 提出by wanglc
			original.setWechatUnique(wechat.getUnionid());
			original.setTeamPhotoUrl(wechat.getHeadimgurl());
			original.setThirdLoginType(PmsTeam.LTYPE_WECHAT);
			boolean isBind = providerThirdLogin.login(original, request);
			if (isBind) {
				return new ModelAndView("/provider/portal");
			} else {
				HttpSession httpSession = request.getSession();
				String unique = original.getWechatUnique();
				httpSession.setAttribute(UNIQUE, unique);
				modelMap.put("linkMan", original.getLinkman());
				modelMap.put("LType", original.getThirdLoginType());
				return new ModelAndView("/provider/threeLogin", modelMap);
			}
		}
	}

	@RequestMapping("/repwd")
	public ModelAndView repwd(ModelMap modelMap) {
		modelMap.addAttribute("userType", PmsConstant.ROLE_PROVIDER);
		return new ModelAndView("/repwd", modelMap);
	}

	@RequestMapping("/updatePwd")
	public ModelAndView updatePwd(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("userType", PmsConstant.ROLE_PROVIDER);
		SessionInfo sessionInfo = getCurrentInfo(request);
		modelMap.addAttribute("userLoginName", sessionInfo.getLoginName());
		modelMap.addAttribute("userId", sessionInfo.getReqiureId());
		return new ModelAndView("/updatePwd", modelMap);
	}

	@RequestMapping(value = "/set/masterWork", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public boolean setMasterWork(@RequestBody final PmsProduct product, HttpServletRequest request) {
		final String updateUrl = PublicConfig.URL_PREFIX + "portal/set/masterWork";
		HttpUtil.httpPost(updateUrl, product, request);
		return true;
	}

	/**
	 * 第三方绑定状态
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/third/status")
	public Map<String, Object> thirdBindStatus(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		SessionInfo sessionInfo = getCurrentInfo(request);
		PmsTeam team = new PmsTeam();
		team.setTeamId(sessionInfo.getReqiureId());
		final String url = PublicConfig.URL_PREFIX + "portal/team/third/status";
		final String json = HttpUtil.httpPost(url, team, request);
		result = JsonUtil.toBean(json, Map.class);
		return result;
	}

	/**
	 * 个人中心绑定第三方 如果第三方账号已经存在,不允许绑定
	 */
	@RequestMapping("/bind/third")
	public BaseMsg bindThird(final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody final PmsTeam team) {
		BaseMsg baseMsg = new BaseMsg(0, "绑定失败");
		SessionInfo sessionInfo = getCurrentInfo(request);
		team.setTeamId(sessionInfo.getReqiureId());// 填充用户id
		final String url = PublicConfig.URL_PREFIX + "portal/team/info/bind";
		String str = HttpUtil.httpPost(url, team, request);
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
	public boolean unBindThird(@RequestBody final PmsTeam team, final HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		team.setTeamId(sessionInfo.getReqiureId());// 填充用户id
		// 查询该用户是否存在
		final String url = PublicConfig.URL_PREFIX + "portal/team/info/unbind";
		String str = HttpUtil.httpPost(url, team, request);
		Boolean b = JsonUtil.toBean(str, Boolean.class);
		return b;
	}

	@RequestMapping("/info_{teamId}.html")
	public ModelAndView toProviderInfoView(HttpServletRequest request, ModelMap modelMap,
			@PathVariable("teamId") Long teamId) {
		if (teamId == 0l) {
			SessionInfo sessionInfo = getCurrentInfo(request);
			teamId = sessionInfo.getReqiureId();
		}
		// 传递导演信息
		PmsTeam team = pmsTeamFacade.getTeamInfo(teamId);
		if (team != null) {
			modelMap.addAttribute("provider", team);
			// 加载导演标签
			String strtags = team.getBusiness();
			if (ValidateUtil.isValid(strtags)) {
				try {
					String[] tagsarray = strtags.split("\\,");
					List<Integer> ids = new ArrayList<>();
					for (int i = 0; i < tagsarray.length; i++) {
						ids.add(Integer.parseInt(tagsarray[i]));
					}
					List<String> tags = pmsTeamFacade.getTags(ids);
					if (ValidateUtil.isValid(tags)) {
						modelMap.addAttribute("providerTags", JsonUtil.toJson(tags));
					}
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				logger.error("provider business is null ...");
			}
		} else {
			logger.error("PmsTeam is null ...");
		}
		// 加载代表作
		PmsProduct product = pmsProductFacade.getMasterWork(teamId);
		if (product == null) {
			List<PmsProduct> products = pmsProductFacade.loadProductByTeam(teamId);
			if (ValidateUtil.isValid(products)) {
				product = products.get(0);
			}
		}
		if (product != null) {
			modelMap.addAttribute("product", product);
			String[] tags = product.getTags().split("\\ ");
			modelMap.addAttribute("tags", tags);
		} else {
			logger.error("product is null ...");
		}
		return new ModelAndView("/provider/providerInfoPhone", modelMap);
	}

	/**
	 * 初始化 sessionInfo 信息
	 * 
	 * @param user
	 * @param request
	 * @return
	 */
	public boolean initSessionInfo(final PmsTeam team, HttpServletRequest request) {

		// 清空session
		final HttpSession session = request.getSession();
		session.removeAttribute(PmsConstant.SESSION_INFO);
		// 存入session中
		final String sessionId = request.getSession().getId();
		final SessionInfo info = new SessionInfo();
		info.setLoginName(team.getLoginName());
		info.setRealName(team.getTeamName());
		info.setSessionType(PmsConstant.ROLE_PROVIDER);
		info.setToken(DataUtil.md5(sessionId));
		info.setReqiureId(team.getTeamId());
		info.setTelephone(team.getPhoneNumber());
		info.setPhoto(team.getTeamPhotoUrl());
		if (team.getFlag() == 1)
			info.setIsIdentification(true);

		final PmsRole role = pmsRoleFacade.findRoleById(2l); // 获取用户角色
		final List<PmsRole> roles = new ArrayList<PmsRole>();
		roles.add(role);
		team.setRoles(roles);
		// 计算权限码总和
		final long maxPos = pmsRightFacade.getMaxPos();
		final long[] rightSum = new long[(int) (maxPos + 1)];
		team.setRightSum(rightSum);
		team.calculateRightSum();
		info.setSum(team.getRightSum());
		info.setEmail(team.getEmail());
		info.setSuperAdmin(team.isSuperAdmin()); // 判断是否是超级管理员
		session.setAttribute(PmsConstant.SESSION_INFO, info);
		return true;
	}

	public Long updateInfo_register(@RequestBody final PmsTeam team, final HttpServletRequest request) {
		try {
			HttpSession httpSession = request.getSession();
			String type = (String) httpSession.getAttribute(TYPE);
			String original_str = (String) httpSession.getAttribute(ORIGINAL);
			Gson gson = new Gson();
			PmsTeam original = gson.fromJson(original_str, PmsTeam.class);
			if (original != null && ValidateUtil.isValid(type) && type.equals(REGISTER_KET)) {
				team.setPhoneNumber(original.getPhoneNumber());
				if (ValidateUtil.isValid(original.getThirdLoginType())) {
					switch (original.getThirdLoginType()) {
					case PmsTeam.LTYPE_QQ:
						team.setQqUnique(original.getQqUnique());
						break;
					case PmsTeam.LTYPE_WECHAT:
						team.setQqUnique(original.getWechatUnique());
						break;
					case PmsTeam.LTYPE_WEIBO:
						team.setQqUnique(original.getWbUnique());
						break;
					}
				}
				team.setFlag(0);// 设置审核状态为审核中

				PmsTeam dbteam = pmsTeamFacade.register(team);
				if (dbteam != null && dbteam.getTeamId() > 0) {
					smsMQService.sendMessage("132269", team.getPhoneNumber(), null);
					final boolean ret = initSessionInfo(dbteam, request);
					if(ret) {
						return dbteam.getTeamId();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1l;
	}
}