package com.panfeng.web.wearable.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.panfeng.web.wearable.resource.model.IndentResource;
import com.panfeng.web.wearable.service.FileStatusService;
import com.panfeng.web.wearable.service.ResourceService;
import com.panfeng.web.wearable.util.FileUtils;

@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private FileStatusService fileStatusService;

	@Override
	public String getState(IndentResource indentResource) {
		String res=fileStatusService.find(
				FileUtils.getRedisKey(indentResource),
				Long.toString(indentResource.getIrId()));
		return res;
	}

}
