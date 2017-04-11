package com.panfeng.web.wearable.service;

/**
 * 短信发送接口
 */
public interface SmsService {
	public boolean smsSend(final String templateId , final String telephone, final String[] content);
}
