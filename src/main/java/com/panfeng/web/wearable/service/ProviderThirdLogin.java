package com.panfeng.web.wearable.service;

import javax.servlet.http.HttpServletRequest;

import com.paipianwang.pat.facade.team.entity.PmsTeam;

public interface ProviderThirdLogin {
	boolean login(PmsTeam team, HttpServletRequest request);
}
