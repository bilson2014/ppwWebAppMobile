package com.panfeng.web.wearable.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.panfeng.web.wearable.util.ValidateUtil;

public class OutNameTag extends TagSupport {

	private static final long serialVersionUID = -2010299046537359253L;

	public int doStartTag() throws JspException {
		final SessionInfo info = (SessionInfo) pageContext.getSession().getAttribute(PmsConstant.SESSION_INFO);
		
		if(info != null){
			final String realName = info.getRealName();
			if(ValidateUtil.isValid(realName)){
				try {
					pageContext.getOut().print(realName);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else if(ValidateUtil.isValid(info.getLoginName())){
				try {
					pageContext.getOut().print(info.getLoginName());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				try {
					pageContext.getOut().print(info.getTelephone());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return EVAL_BODY_INCLUDE;
	}
}
