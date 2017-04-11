package com.panfeng.web.wearable.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.panfeng.web.wearable.service.KindeditorService;
import com.panfeng.web.wearable.util.VerifyFileUtils;

@Service
public class KindeditorServiceImpl implements KindeditorService {


	@Override
	public String verifyImage(MultipartFile multipartFile, String type) {
		return VerifyFileUtils.verifyFile(multipartFile, type);
	}

	@Override
	public String createMsg(String message, int state) {
		JsonObject jo = new JsonObject();
		jo.addProperty("error", state);
		if (state == PmsConstant.MSG_FAIL)
			jo.addProperty("message", message);
		else
			jo.addProperty("url", message);

		return jo.toString();
	}

}
