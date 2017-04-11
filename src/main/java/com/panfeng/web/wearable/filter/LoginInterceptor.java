package com.panfeng.web.wearable.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;

/**
 * 登陆拦截器
 * 用作验证是否登陆
 * @author Jack
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		final String contextPath = request.getContextPath();

		final SessionInfo info = (SessionInfo) request.getSession().getAttribute(PmsConstant.SESSION_INFO);
		
		if(info != null){
			return true;
		}
		
		response.sendRedirect(contextPath + "/login");
		return false;
	}
	
}
