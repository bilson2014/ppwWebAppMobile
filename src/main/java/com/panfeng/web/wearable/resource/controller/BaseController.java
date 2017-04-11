package com.panfeng.web.wearable.resource.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.facade.user.entity.PmsUser;

/**
 * 资源基类
 * 专用于继承
 * @author GY
 *
 */
public abstract class BaseController {

	private static Logger logger = LoggerFactory.getLogger("error");
	
	// get current user
	protected PmsUser getUser (final HttpServletRequest request){
		
		PmsUser user = null;
		try {
			HttpSession session = request.getSession();
			user = (PmsUser) session.getAttribute("username");
		} catch (Exception e) {
			logger.error("Retrieve username error ...",e);
			e.printStackTrace();
		}
		if(user == null){
			user = new PmsUser();
			user.setUserName("缺省用户");
		}
		return user;
	}
	
	protected SessionInfo getCurrentInfo(final HttpServletRequest request){
		
		final SessionInfo info = (SessionInfo) request.getSession().getAttribute(PmsConstant.SESSION_INFO);
		
		return info;
	}
	
}
