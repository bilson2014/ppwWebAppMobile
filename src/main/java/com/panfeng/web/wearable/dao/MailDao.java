package com.panfeng.web.wearable.dao;


import com.paipianwang.pat.facade.information.entity.PmsMail;

public interface MailDao {

	public PmsMail getMailFromRedis(final String type);
	
	public void addMailByRedis(final PmsMail mail);
	
	public void removeMailFromRedis(final String type);
}
