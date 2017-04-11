package com.panfeng.web.wearable.service;

import javax.servlet.http.HttpServletRequest;

import com.paipianwang.pat.facade.right.entity.PmsEmployee;
import com.panfeng.web.wearable.resource.model.Wechat;

public interface EmployeeThirdLogin {
	boolean login(PmsEmployee team, HttpServletRequest request);

	Wechat decodeWechatToken(String code, HttpServletRequest request);

}
