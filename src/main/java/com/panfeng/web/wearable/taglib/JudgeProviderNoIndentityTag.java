package com.panfeng.web.wearable.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;

/**
 * 该自定义标签用于判断供应商是否登陆并且未审核
 * 如果已审核通过，则不显示;反之则显示
 * @author Jack
 *
 */
public class JudgeProviderNoIndentityTag extends TagSupport {

	private static final long serialVersionUID = 1009368661198300917L;
	
	public int doStartTag() throws JspException {
		final SessionInfo info = (SessionInfo) pageContext.getSession().getAttribute(PmsConstant.SESSION_INFO);
		
		if(info != null){
			if(info.getSessionType().indexOf("provider") > -1){
				if(!info.isIdentification()){
					
					return EVAL_BODY_INCLUDE;
				}
			}
		}
		
		return SKIP_BODY;
	}

}
