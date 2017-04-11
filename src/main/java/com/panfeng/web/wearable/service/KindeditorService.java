package com.panfeng.web.wearable.service;

import org.springframework.web.multipart.MultipartFile;

public interface KindeditorService {

	public String verifyImage(final MultipartFile multipartFile, final String type);

	public String createMsg(final String message,final int state);
	
}
