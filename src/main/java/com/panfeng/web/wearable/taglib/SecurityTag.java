package com.panfeng.web.wearable.taglib;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.facade.right.entity.PmsRight;
import com.paipianwang.pat.facade.right.service.PmsRightFacade;
import com.panfeng.web.wearable.util.UrlResourceUtils;
import com.panfeng.web.wearable.util.ValidateUtil;

public class SecurityTag extends TagSupport{

	private static final long serialVersionUID = 7559934431060093945L;

	private String uri = null;
	
	public int doStartTag() throws JspException {
		
		if(ValidateUtil.isValid(uri)){
			final ServletContext sc = pageContext.getServletContext();
			WebApplicationContext wc = WebApplicationContextUtils.findWebApplicationContext(sc);
			final PmsRightFacade pmsRightFacade = (PmsRightFacade) wc.getBean("pmsRightFacade");
			final String url = UrlResourceUtils.URLResolver(uri, sc.getContextPath());
			final SessionInfo info = (SessionInfo) pageContext.getSession().getAttribute(PmsConstant.SESSION_INFO);
			
			if(info != null){
				if(info.isSuperAdmin()){
					// 超级管理员
					return EVAL_BODY_INCLUDE;
				}else {
					// session 存在
					PmsRight right = pmsRightFacade.getRightFromRedis(url);
					if(right != null){
						if(info.hasRight(right)){
							
							return EVAL_BODY_INCLUDE;
						}
					}
				}
			}
		}
		return SKIP_BODY;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}
	
}
