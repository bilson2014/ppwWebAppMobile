package com.panfeng.web.wearable.resource.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
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

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.PmsResult;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.product.entity.PmsEmployeeProductLink;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.service.PmsEmployeeProductLinkFacade;
import com.paipianwang.pat.facade.right.entity.PmsEmployee;
import com.paipianwang.pat.facade.right.entity.PmsRole;
import com.paipianwang.pat.facade.right.service.PmsEmployeeFacade;
import com.paipianwang.pat.facade.right.service.PmsRightFacade;
import com.paipianwang.pat.facade.right.service.PmsRoleFacade;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.paipianwang.pat.facade.user.entity.PmsUser;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.domain.Result;
import com.panfeng.web.wearable.resource.model.ActivitiTask;
import com.panfeng.web.wearable.resource.model.BizBean;
import com.panfeng.web.wearable.resource.model.Employee;
import com.panfeng.web.wearable.resource.model.IndentComment;
import com.panfeng.web.wearable.resource.model.IndentFlow;
import com.panfeng.web.wearable.resource.model.IndentProject;
import com.panfeng.web.wearable.resource.model.IndentResource;
import com.panfeng.web.wearable.resource.model.Wechat;
import com.panfeng.web.wearable.security.AESUtil;
import com.panfeng.web.wearable.service.EmployeeThirdLogin;
import com.panfeng.web.wearable.service.ResourceService;
import com.panfeng.web.wearable.util.DataUtil;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;
import com.panfeng.web.wearable.util.WechatUtils;

@RestController
@RequestMapping("/mgr")
public class VersionManagerController extends BaseController {

	private static Logger logger = LoggerFactory.getLogger("error");
	
	@Autowired
	private PmsEmployeeFacade pmsEmployeeFacade = null;
	
	@Autowired
	private final PmsRoleFacade pmsRoleFacade = null;

	@Autowired
	private final PmsRightFacade pmsRightFacade = null;
	
	@Autowired
	private ResourceService resourceService = null;
	
	@Autowired
	private PmsEmployeeProductLinkFacade pmsEmployeeProductLinkFacade = null;
	
	@Autowired
	private EmployeeThirdLogin employeeThirdLogin = null;
	
	static String UNIQUE = "unique_e";
	static String LINKMAN = "username_e";

	/**
	 * 登录
	 */
	@RequestMapping("/doLogin")
	public Result doLogin(final HttpServletRequest request, @RequestBody final PmsEmployee employee) {

		final Result result = new Result();
		if (employee != null) {
			final String pwd = employee.getEmployeePassword();
			final String loginName = employee.getEmployeeLoginName();
			if (ValidateUtil.isValid(loginName) && ValidateUtil.isValid(pwd)) {
				// 解密
				try {
					final String password = AESUtil.Decrypt(pwd, PmsConstant.UNIQUE_KEY);
					employee.setEmployeePassword(DataUtil.md5(password));
					
					final PmsEmployee e = pmsEmployeeFacade.doLogin(employee.getEmployeeLoginName(), employee.getEmployeePassword());
					if (e != null) {
						//填充角色
						request.getSession().removeAttribute(PmsConstant.SESSION_INFO);
						result.setRet(initSessionInfo(e, request));
					}else {
						result.setRet(false);
						result.setMessage("用户名或密码错误!");
					}
					return result;
					
					
				} catch (Exception e) {
					logger.error("VersionManager login error,Becase of decrypt password error ...");
					e.printStackTrace();
				}
			}
		}

		result.setRet(false);
		result.setMessage("用户名或密码错误!");
		return result;
	}

	/**
	 * 三方登录
	 * 
	 * @param json
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/thirdLogin")
	public ModelAndView thirdLogin(String json, final HttpServletRequest request, ModelMap modelMap) {
		if (!ValidateUtil.isValid(json))
			return new ModelAndView("/manager/login");
		PmsEmployee original = JsonUtil.toBean(json, PmsEmployee.class);
		boolean isBind = employeeThirdLogin.login(original, request);
		if (isBind) {
			return new ModelAndView("/manager/index");
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
			httpSession.setAttribute(LINKMAN, original.getEmployeeRealName());
			modelMap.put("linkMan", original.getEmployeeRealName());
			modelMap.put("LType", original.getThirdLoginType());
			return new ModelAndView("/manager/threeLogin", modelMap);
		}
	}

	@RequestMapping("/wechat/callback.do")
	public ModelAndView loginWithWeChat(@RequestParam("code") String code, final HttpServletRequest request,
			ModelMap modelMap) {
		Wechat wechat = WechatUtils.decodeWechatToken(code, request);
		if (wechat == null)
			return new ModelAndView("/provider/threeLogin");
		PmsEmployee original = new PmsEmployee();
		original.setThirdLoginType(PmsTeam.LTYPE_WECHAT);
		original.setEmployeeRealName(wechat.getNickname());
		original.setWechatUnique(wechat.getUnionid());
		original.setEmployeeImg(wechat.getHeadimgurl());
		boolean isBind = employeeThirdLogin.login(original, request);
		if (isBind) {
			return new ModelAndView("/provider/portal");
		} else {
			HttpSession httpSession = request.getSession();
			String unique = original.getWechatUnique();
			httpSession.setAttribute(UNIQUE, unique);
			modelMap.put("linkMan", original.getEmployeeRealName());
			modelMap.put("LType", original.getThirdLoginType());
			return new ModelAndView("/provider/threeLogin", modelMap);
		}
	}

	@RequestMapping("/bind")
	public BaseMsg bind(@RequestBody final Employee employee, final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		final String phone = employee.getPhoneNumber();
		final String Ltype = employee.getThirdLoginType();
		final Object objUnique = httpSession.getAttribute(UNIQUE);
		final Object objLinkman = httpSession.getAttribute(LINKMAN);
		final Object objCode = request.getSession().getAttribute("code");
		if (ValidateUtil.isValid(phone) && ValidateUtil.isValid(Ltype) && objUnique != null && objCode != null) {
			// 不需要输入验证码
			try {
				final String Unique = (String) objUnique;
				final String realName = (String) objLinkman;
				final String code = (String) objCode;
				boolean isTest = PublicConfig.IS_AUTO_TEST.equals("yes") ? true : false;
				// 不需要输入验证码 code == null dev code != null
				if (isTest || code.equals(employee.getVerification_code())) {
					employee.setEmployeeRealName(realName);
					if (ValidateUtil.isValid(Unique)) {
						switch (Ltype) {
						case PmsTeam.LTYPE_QQ:
							employee.setQqUnique(Unique);
							break;
						case PmsTeam.LTYPE_WECHAT:
							employee.setWechatUnique(Unique);
							break;
						case PmsTeam.LTYPE_WEIBO:
							employee.setWbUnique(Unique);
							break;
						}
						// 后台绑定
						final String url = PublicConfig.URL_PREFIX + "portal/manager/thirdLogin/bind";
						final String json = HttpUtil.httpPost(url, employee, request);
						if (ValidateUtil.isValid(json)) {
							final BaseMsg msg = JsonUtil.toBean(json, BaseMsg.class);
							if (msg.getErrorCode() == BaseMsg.NORMAL) {
								// 成功删除 session
								httpSession.removeAttribute(UNIQUE);
								httpSession.removeAttribute(LINKMAN);
							}
							return msg;
						}
					}
				}
			} catch (Exception e) {
				logger.error("Provider bind error,teamName is " + employee.getEmployeeRealName());
				e.printStackTrace();
			}
		}
		return new BaseMsg(BaseMsg.ERROR, "绑定失败", null);
	}

	/**
	 * 验证手机号唯一性
	 * 
	 * @param phoneNumber
	 *            手机号码
	 */
	@RequestMapping("/recover/check/{phoneNumber}")
	public boolean checkPhoneNumber(@PathVariable("phoneNumber") final String phoneNumber,
			final HttpServletRequest request) {

		if (ValidateUtil.isValid(phoneNumber)) {
			final String url = PublicConfig.URL_PREFIX + "portal/manager/static/checkNumber/" + phoneNumber;
			final String json = HttpUtil.httpGet(url, request);
			if (ValidateUtil.isValid(json)) {
				Long count = JsonUtil.toBean(json, Long.class);
				if (count > 0) {
					return true;
				}

			}
		}

		return false;
	}

	// ////////////////////////////////////project/////////////////////////////////////////////////////////////

	@RequestMapping(value = "/projects/save", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public boolean projectsSave(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);

		final String url = PublicConfig.URL_PREFIX + "project/save";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			boolean result = JsonUtil.toBean(str, Boolean.class);
			return result;
		}
		return false;
	}

	@RequestMapping(value = "/projects/remove/synergy", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public boolean removeSynergy(@RequestBody final BizBean bizBean, final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "project/remove/synergy";
		String str = HttpUtil.httpPost(url, bizBean, request);
		if (ValidateUtil.isValid(str)) {
			boolean ret = JsonUtil.toBean(str, Boolean.class);
			return ret;
		}
		return false;
	}

	@RequestMapping(value = "/projects/get/synergys", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentProject> getSynergys(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);

		final String url = PublicConfig.URL_PREFIX + "project/get/synergys";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}

		return new ArrayList<>();
	}

	@RequestMapping(value = "/projects/search/employee/list", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<PmsEmployee> searchEmployee(@RequestBody BizBean bizBean, final HttpServletRequest request) {
		// fill userinfo
		final String url = PublicConfig.URL_PREFIX + "portal/search/employee/list";
		String str = HttpUtil.httpPost(url, bizBean, request);
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}

		return new ArrayList<>();
	}

	@RequestMapping("/projects/flow-index")
	public ModelAndView projectsView(final ModelMap model, String key) {
		model.put("key", key);
		return new ModelAndView("/customer/customerProject", model);
	}

	@RequestMapping(value = "/flow/verifyIntegrity", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public BaseMsg verifyIntegrity(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "verifyIntegrity";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, BaseMsg.class);
		}
		return new BaseMsg(BaseMsg.ERROR, "请求失败！", null);
	}
	
	@RequestMapping("/projects/upadte-view")
	public ModelAndView updateview(final ModelMap model, @RequestParam String key) {
		model.put("state", "update");
		model.put("key", key == null ? "" : key);
		return new ModelAndView("/manager/updateProjectInfo", model);
	}

	@RequestMapping(value = "/projects/all-project", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentProject> getUserAllProject(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);

		final String url = PublicConfig.URL_PREFIX + "project/all-project";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}

		return new ArrayList<>();
	}

	@RequestMapping(value = "/projects/get-projectInfo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public IndentProject getProjectInfo(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);

		final String url = PublicConfig.URL_PREFIX + "project/get-projectInfo";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, IndentProject.class);
		}

		return new IndentProject();
	}

	@RequestMapping(value = "/projects/get-redundantProject", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public IndentProject getRedundantProject(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "project/get-redundantProject";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, IndentProject.class);
		}

		return new IndentProject();
	}

	@RequestMapping("/projects/update-indentProject")
	public boolean updateIndentProject(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "project/update-synergyProject";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}

		return false;
	}

	@RequestMapping("/projects/getProjectTags")
	public List<Map<String, Object>> getProjectTags(final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "project/getProjectTags";
		String str = HttpUtil.httpGet(url, request);
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping("/projects/cancelProject")
	public boolean cancelProject(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "project/cancelProject";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping("/projects/get/SerialID")
	public String getProjectSerialID(final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "project/get/SerialID";
		String str = HttpUtil.httpGet(url, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return str;
		}
		return "";
	}

	@RequestMapping("/projects/verifyProjectInfo")
	public BaseMsg verifyProjectInfo(final HttpServletRequest request, @RequestBody IndentProject indentProject) {
		final String url = PublicConfig.URL_PREFIX + "project/verifyProjectInfo";
		String str = HttpUtil.httpPost(url, indentProject, request);
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, BaseMsg.class);
		}
		return new BaseMsg(BaseMsg.ERROR, "服务器繁忙", "");
	}

	@RequestMapping("/projects/team/search/info")
	public List<PmsTeam> getTeamByName(@RequestBody final PmsTeam team, final HttpServletRequest request) {
		// fill userinfo
		final String url = PublicConfig.URL_PREFIX + "portal/team/search/info";
		String str = HttpUtil.httpPost(url, team, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping("/projects/user/search/info")
	public List<PmsUser> getUserByName(@RequestBody final PmsUser user, final HttpServletRequest request) {
		// fill userinfo
		final String url = PublicConfig.URL_PREFIX + "portal/user/search/info";
		String str = HttpUtil.httpPost(url, user, request);
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	/**
	 * 跳转项目信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/flow/add-view")
	public ModelAndView flowView(final ModelMap model) {
		return new ModelAndView("/manager/updateProjectInfo", model);
	}

	@RequestMapping(value = "/flow/getnodes", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<ActivitiTask> getFlowNodes(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "getnodes";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping(value = "/flow/startProcess", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public boolean startProcess(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "startProcess";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping(value = "/flow/getCurrectTask", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ActivitiTask getCurrectTask(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "getCurrectTask";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, ActivitiTask.class);
		}
		return new ActivitiTask();
	}

	@RequestMapping("/flow/completeTask")
	public BaseMsg completeTask(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "completeTask";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, BaseMsg.class);
		}
		return new BaseMsg();
	}

	@RequestMapping(value = "/flow/getIndentFlows", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentFlow> getIndentFlows(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "getIndentFlows";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping("/flow/suspendProcess")
	public boolean suspendProcess(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "suspendProcess";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping("/flow/resumeProcess")
	public boolean resumeProcess(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "resumeProcess";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping("/flow/removeProcess")
	public boolean removeProcess(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "removeProcess";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping("/flow/jumpPrevTask")
	public boolean jumpPrevTask(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "jumpPrevTask";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	// /////////////////////////////doc/////////////////////////////////////

	@RequestMapping("/doc/getDocView")
	public String getViewUrl(@RequestBody final IndentResource indentResource, final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "getDocView";
		String str = HttpUtil.httpPost(url, indentResource, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return str;
		}
		return "";
	}

	@RequestMapping("/doc/video/{name}.{ext}")
	public ModelAndView getVideoView(final HttpServletRequest request, @PathVariable("name") String name,
			@PathVariable("ext") String ext) {
		request.setAttribute("filename", "/portal/project/doc/" + name + "." + ext);
		return new ModelAndView("/manager/show-video");
	}

	// ////////////////////////////comment/////////////////////////////////////////

	@RequestMapping(value = "/comment/addComment", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public long addComment(@RequestBody final IndentComment indentComment, final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentComment);
		final String url = PublicConfig.URL_PREFIX + "addComment";
		String str = HttpUtil.httpPost(url, indentComment, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Long.class);
		}
		return 0;
	}

	@RequestMapping(value = "/comment/getAllComment", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentComment> getAllComment(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "getAllComment";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	// /////////////////////////////Resource////////////////////////////////////////

	@RequestMapping(value = "/resource/addResource", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public String addResource(@RequestParam final MultipartFile addfile, final IndentProject indentProject,
			final HttpServletRequest request) {
		fillUserInfo(request, indentProject);

		final String url = PublicConfig.URL_PREFIX + "addResource";
		MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder.create();
		multipartEntityBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
		multipartEntityBuilder.setCharset(Charset.forName("utf-8"));
		try {
			multipartEntityBuilder.addTextBody("id", indentProject.getId() + "",
					ContentType.create("text/plain", Charset.forName("utf-8")));
			multipartEntityBuilder.addTextBody("tag", indentProject.getTag() + "",
					ContentType.create("text/plain", Charset.forName("utf-8")));
			multipartEntityBuilder.addTextBody("userType", indentProject.getUserType() + "",
					ContentType.create("text/plain", Charset.forName("utf-8")));
			multipartEntityBuilder.addTextBody("userId", indentProject.getUserId() + "",
					ContentType.create("text/plain", Charset.forName("utf-8")));

			multipartEntityBuilder.addBinaryBody("addfile", addfile.getBytes(),
					ContentType.create(addfile.getContentType()), addfile.getOriginalFilename());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String str = HttpUtil.httpPostFileForm(url, multipartEntityBuilder, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, String.class);
		}
		return "";
	}

	// 获取文件状态
	@RequestMapping(value = "/resource/get/state", produces = "application/text; charset=UTF-8")
	public String getState(@RequestBody IndentResource indentResource) {
		String statr = resourceService.getState(indentResource);
		return "{\"state\":\"" + statr + "\"}";
	}

	@RequestMapping(value = "/comment/getResourceList", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentResource> getResourceList(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "getResourceList";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// PmsUser information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping(value = "/comment/getTags", produces = "application/json; charset=UTF-8")
	public List<IndentResource> getTags(final HttpServletRequest request) {
		final String url = PublicConfig.URL_PREFIX + "getTags";
		String str = HttpUtil.httpGet(url, request);
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	private void fillUserInfo(HttpServletRequest request, IndentProject indentProject) {
		final SessionInfo info = getCurrentInfo(request);
		if (indentProject == null || info == null)
			return;
		// fill user info
		indentProject.setUserId(info.getReqiureId());
		indentProject.setUserType(info.getSessionType());
	}

	private void fillUserInfo(HttpServletRequest request, IndentComment indentComment) {
		final SessionInfo info = getCurrentInfo(request);
		if (indentComment == null || info == null)
			return;
		// fill user info
		indentComment.setIcUserId(info.getReqiureId());
		indentComment.setIcUserType(info.getSessionType());
	}

	// 手机端项目主页
	@RequestMapping("/index")
	public ModelAndView goToIndex(ModelMap model, HttpServletRequest request) {
		SessionInfo sessionInfo = getCurrentInfo(request);
		model.put("userInfo", sessionInfo);
		return new ModelAndView("/project", model);
	}
	
	/**
	 * 跳转 内部员工的 作品收藏页面
	 * 
	 * @return
	 */
	@RequestMapping("/favourites")
	public ModelAndView view(HttpServletRequest request, ModelMap map) {
		final SessionInfo info = (SessionInfo) request.getSession().getAttribute(PmsConstant.SESSION_INFO);
		if(info != null) {
			List<PmsProduct> list = pmsEmployeeProductLinkFacade.findProductIdsByEmployeeId(info.getReqiureId());
			map.put("productList", list);
		}
		return new ModelAndView("/manager/collect", map);
	}
	
	/**
	 * 删除收藏作品
	 * @param productId 作品ID
	 * @return
	 */
	@RequestMapping("/favourites/remove/{productId}")
	public PmsResult deleteFavourites(@PathVariable("productId") final Long productId, final HttpServletRequest request) {
		PmsResult prst = new PmsResult();
		if(productId != null) {
			final SessionInfo info = (SessionInfo) request.getSession().getAttribute(PmsConstant.SESSION_INFO);
			if(info != null) {
				List<PmsEmployeeProductLink> list = new ArrayList<PmsEmployeeProductLink>();
				PmsEmployeeProductLink link = new PmsEmployeeProductLink();
				link.setEmployeeId(info.getReqiureId());
				link.setProductId(productId);
				list.add(link);
				boolean result = pmsEmployeeProductLinkFacade.deleteByEmployeeIdsAndproIds(list);
				prst.setResult(result);
				return prst;
			} else {
				// session 为空
				prst.setErr("请重新登录!");
			}
		} else {
			// 作品ID为空
			prst.setErr("请选择作品删除!");
		}
		prst.setResult(false);
		return prst;
	}
	
	/**
	 * 添加作品收藏
	 * @param productId 作品ID
	 * @return
	 */
	@RequestMapping("/favourites/add/{productId}")
	public PmsResult addFavourites(@PathVariable("productId") final Long productId, final HttpServletRequest request) {
		PmsResult prst = new PmsResult();
		if(productId != null) {
			final SessionInfo info = (SessionInfo) request.getSession().getAttribute(PmsConstant.SESSION_INFO);
			if(info != null) {
				PmsEmployeeProductLink link = new PmsEmployeeProductLink();
				link.setEmployeeId(info.getReqiureId());
				link.setProductId(productId);
				boolean result = pmsEmployeeProductLinkFacade.save(link);
				prst.setResult(result);
				return prst;
			} else {
				// session 为空
				prst.setErr("请重新登录!");
			}
		} else {
			// 作品ID为空
			prst.setErr("请选择作品删除!");
		}
		prst.setResult(false);
		return prst;
	}
	
	/**
	 * 判断该影片是否被当前登录者收藏
	 * @param productId 作品ID
	 * @return true | false
	 */
	@RequestMapping("/favourites/judge/{productId}")
	public PmsResult judgeFavourites(@PathVariable("productId") final Long productId, final HttpServletRequest request) {
		// 判断该影片是否是收藏的
		PmsResult prst = new PmsResult();
		if(productId != null) {
			final SessionInfo info = (SessionInfo) request.getSession().getAttribute(PmsConstant.SESSION_INFO);
			if(info != null) {
				Map<String ,Object> param = new HashMap<String, Object>();
				param.put("employeeId", info.getReqiureId());
				param.put("productId", productId);
				List<PmsEmployeeProductLink> list = pmsEmployeeProductLinkFacade.findLinkByParam(param);
				prst.setResult(ValidateUtil.isValid(list));
				return prst;
			} else {
				// session 为空
				prst.setErr("请重新登录!");
			}
		} else {
			// 作品ID为空
			prst.setErr("请选择作品删除!");
		}
		prst.setResult(false);
		return prst;
	}

	/**
	 * 初始化 sessionInfo 信息
	 */
	public boolean initSessionInfo(final PmsEmployee e, final HttpServletRequest request) {
		// 存入session中
		final String sessionId = request.getSession().getId();
		final SessionInfo info = new SessionInfo();
		info.setLoginName(e.getEmployeeLoginName());
		info.setRealName(e.getEmployeeRealName());
		info.setSessionType(PmsConstant.ROLE_EMPLOYEE);
		info.setToken(DataUtil.md5(sessionId));
		info.setReqiureId(e.getEmployeeId());
		info.setPhoto(e.getEmployeeImg());
		info.setTelephone(e.getPhoneNumber());

		// 计算权限码
		// 替换带有权限的角色
		final List<PmsRole> roles = new ArrayList<PmsRole>();
		for (final PmsRole r : e.getRoles()) {
			final PmsRole role = pmsRoleFacade.findRoleById(r.getRoleId());
			roles.add(role);
		}
		e.setRoles(roles);

		// 计算权限码总和
		final long maxPos = pmsRightFacade.getMaxPos();
		final long[] rightSum = new long[(int) (maxPos + 1)];

		e.setRightSum(rightSum);
		e.calculateRightSum();
		long[] sum = e.getRightSum();
		info.setSum(sum);
		info.setSuperAdmin(e.isSuperAdmin()); // 判断是否是超级管理员
		request.getSession().setAttribute(PmsConstant.SESSION_INFO, info);
		return true;
	}
}
