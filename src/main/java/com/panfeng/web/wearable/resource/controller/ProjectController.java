package com.panfeng.web.wearable.resource.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.resource.model.IndentComment;
import com.panfeng.web.wearable.resource.model.IndentProject;
import com.panfeng.web.wearable.resource.model.IndentResource;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
@RequestMapping("/project")
public class ProjectController extends BaseController {

	final Logger logger = LoggerFactory.getLogger("error");

	@RequestMapping(value = "/all-project", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentProject> getUserAllProject(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		System.err.println("用户" + indentProject.getUserId() + " 查看了项目列表，角色是 " + indentProject.getUserType());
		
		final String url = PublicConfig.URL_PREFIX + "project/phone-project";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping(value = "/get-projectInfo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public IndentProject getProjectInfo(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);

		final String url = PublicConfig.URL_PREFIX + "project/get-projectInfo";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, IndentProject.class);
		}

		return new IndentProject();
	}

	@RequestMapping(value = "/getResourceList", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentResource> getResourceList(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "getResourceList";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping(value = "/getAllComment", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<IndentComment> getAllComment(@RequestBody final IndentProject indentProject,
			final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "getAllComment";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		}
		return new ArrayList<>();
	}

	@RequestMapping(value = "/addComment", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public long addComment(@RequestBody final IndentComment indentComment, final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentComment);
		final String url = PublicConfig.URL_PREFIX + "addComment";
		String str = HttpUtil.httpPost(url, indentComment, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Long.class);
		}
		return 0;
	}

	@RequestMapping("/flow/completeTask")
	public BaseMsg completeTask(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "completeTask";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, BaseMsg.class);
		}
		return new BaseMsg();
	}

	@RequestMapping("/flow/jumpPrevTask")
	public boolean jumpPrevTask(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "jumpPrevTask";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping("/cancelProject")
	public boolean cancelProject(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		// fill userinfo
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "project/cancelProject";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
	}

	@RequestMapping("/flow/suspendProcess")
	public boolean suspendProcess(@RequestBody final IndentProject indentProject, final HttpServletRequest request) {
		fillUserInfo(request, indentProject);
		final String url = PublicConfig.URL_PREFIX + "suspendProcess";
		String str = HttpUtil.httpPost(url, indentProject, request);
		// User information = null;
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
		// User information = null;
		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, Boolean.class);
		}
		return false;
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
}
