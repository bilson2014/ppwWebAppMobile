package com.panfeng.web.wearable.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.facade.team.entity.PmsTeam;
import com.panfeng.web.wearable.service.ProviderThirdLogin;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;
import com.panfeng.web.wearable.util.ValidateUtil;

@Service
public class ProviderThirdLoginImpl implements ProviderThirdLogin {

	final static String url = PublicConfig.URL_PREFIX + "portal/team/thirdLogin/isExist";
	final Logger logger = LoggerFactory.getLogger("error");

	/**
	 * 1.检测QQ号码是否注册过</br>
	 * 2.(已经注册并绑定过手机)将供应商信息存入session</br>
	 * 3.(为绑定过)跳转绑定页</br>
	 * 4.(全新)</br>
	 * 跳转帮定页
	 */
	@Override
	public boolean login(PmsTeam team, HttpServletRequest request) {
		final String json = HttpUtil.httpPost(url, team, request);
		if (ValidateUtil.isValid(json)) {
			return JsonUtil.toBean(json, Boolean.class);
		} else {
			return false;
		}
	}
}
