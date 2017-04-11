package com.panfeng.web.wearable.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.facade.right.entity.PmsEmployee;
import com.panfeng.web.wearable.resource.model.Wechat;
import com.panfeng.web.wearable.service.EmployeeThirdLogin;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;
import com.panfeng.web.wearable.util.ValidateUtil;

@Service
public class EmployeeThirdLoginImpl implements EmployeeThirdLogin {
	final static String url = PublicConfig.URL_PREFIX + "portal/manager/thirdLogin/isExist";
	final Logger logger = LoggerFactory.getLogger("error");

	@Override
	public boolean login(PmsEmployee employee, HttpServletRequest request) {
		final String json = HttpUtil.httpPost(url, employee, request);
		if (ValidateUtil.isValid(json)) {
			return JsonUtil.toBean(json, Boolean.class);
		} else {
			return false;
		}
	}
	@Override
	public Wechat decodeWechatToken(String code, HttpServletRequest request) {
		return null;
	}

}
