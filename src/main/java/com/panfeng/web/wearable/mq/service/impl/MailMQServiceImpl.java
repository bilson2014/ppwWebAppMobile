package com.panfeng.web.wearable.mq.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.paipianwang.pat.facade.information.entity.PmsMail;
import com.paipianwang.pat.facade.information.service.PmsMailFacade;
import com.panfeng.web.wearable.dao.MailDao;
import com.panfeng.web.wearable.mq.service.MailMQService;
import com.panfeng.web.wearable.util.Log;
import com.panfeng.web.wearable.util.MailTemplateFactory;
/**
 * 邮件队列服务
 * @author Jack
 *
 */
@Service
public class MailMQServiceImpl implements MailMQService {

	@Autowired
	private final JmsTemplate mailJmsTemplate = null;
	@Autowired
	private final MailDao mailDao = null;
	@Autowired
	private final PmsMailFacade pmsMailFacade = null;
	
	@Override
	public void sendMessage(final String to, final String subject, final String content) {
		mailJmsTemplate.send(new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				final Map<String,Object> resultMap = new HashMap<String,Object>();
				resultMap.put("to", to);
				resultMap.put("subject", subject);
				resultMap.put("content", content);
				return session.createTextMessage(JSON.toJSONString(resultMap));
			}
		});
	}

	@Override
	public void sendMailsByType(String mailType, Map<String, String[]> map) {
			PmsMail m = mailDao.getMailFromRedis(mailType);
			if(null == m)m = pmsMailFacade.getTemplateByType(mailType);
			if(null != m){
				try {
					String content = m.getContent();
					//1.转码
					content = new String(Base64.getDecoder().decode(content),"utf-8");
					//2.添加首尾模板
					content = MailTemplateFactory.addHtml(content);
					content = MailTemplateFactory.addImgHost(content);
					Iterator<Entry<String, String[]>> i = map.entrySet().iterator(); 
					while(i.hasNext()){
						Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>)i.next();
						String email = entry.getKey().toString();
						String[] str = entry.getValue();
						String c = MailTemplateFactory.decorate(str,content);
						// 发送邮件
						sendMessage(email,m.getSubject(),c);
					}
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}else{
				Log.error("the mail type" + mailType + " is not exist",null);
			}
	}
}
