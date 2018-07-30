package com.panfeng.web.wearable.filter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.enums.SourceChannelsEnum;
import com.paipianwang.pat.common.web.file.FastDFSClient;
import com.panfeng.web.wearable.dao.DataCacheDao;
import com.panfeng.web.wearable.dao.StorageLocateDao;
import com.panfeng.web.wearable.util.DataUtil;
import com.panfeng.web.wearable.util.ValidateUtil;

/**
 * URL拦截器
 * 添加token访问机制
 * @author Jack
 *
 */
public class TokenInterceptor implements HandlerInterceptor {

	@Autowired
	private final StorageLocateDao storageDao = null;
	@Autowired
	private DataCacheDao dataCacheDao;
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		// 获取session
		final HttpSession session = request.getSession();
		// 获取session的token
		String stoken = (String) session.getAttribute("csrftoken");
		
		if(!ValidateUtil.isValid(stoken)){
			// 如果没有，则创建
			stoken = DataUtil.getUuid();
			session.setAttribute("csrftoken", stoken);
		}
		
		// 配置全局官方电话
		final String offical_phone = (String) session.getAttribute(PmsConstant.OFFICAL_PHONE_MARK);
		
		// 判断session中是否存储官网电话信息，如果没有则添加；反之则不做操作
		if(StringUtils.isBlank(offical_phone) || !(PmsConstant.OFFICAL_PHONE.equals(offical_phone)))
			session.setAttribute(PmsConstant.OFFICAL_PHONE_MARK, PmsConstant.OFFICAL_PHONE);
		
		// 获取URL中的参数，判断是否为渠道参数
		// target 是标识流量来源
		String target = request.getParameter("target");
		if(StringUtils.isNotBlank(target)) {
			final SourceChannelsEnum sce = SourceChannelsEnum.getEnum(target);
			if(sce != null) {
				// 判断session中是否含有标识流量来源
				final String target_desc = (String) session.getAttribute(PmsConstant.SOURCE_CHANNELS);
				if(StringUtils.isBlank(target_desc) || !(sce.getDesc().equals(target_desc)))
					request.getSession().setAttribute(PmsConstant.SOURCE_CHANNELS, sce.getDesc());
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
		if(mv != null) {
			// 如果不为空，则说明进入视图解析器
			final Map<String, String> nodeMap = storageDao.getStorageFromRedis(PmsConstant.STORAGE_NODE_RELATIONSHIP);
			// 获取最优Storage节点
			final String serviceIP = FastDFSClient.locateSource();
			String ip = "";
			final StringBuffer sbf = new StringBuffer();
//			sbf.append(request.getScheme()+"://");
			sbf.append("https://");
			if(ValidateUtil.isValid(serviceIP)) {
				ip = nodeMap.get(serviceIP);
				if(ValidateUtil.isValid(ip)) {
					sbf.append(ip);
//					if(request.getScheme().equals("http")){
//						sbf.append(":8888/");
//					}else{
						sbf.append("/");
//					}
				} else {
					sbf.append(PublicConfig.FDFS_BACKUP_SERVER_PATH);
				}
			} else {
				sbf.append(PublicConfig.FDFS_BACKUP_SERVER_PATH);
			}
			
			mv.addObject(PmsConstant.FILE_LOCATE_STORAGE_PATH, sbf.toString());
		}
		
		HttpSession session=request.getSession();
		final SessionInfo info = (SessionInfo) session.getAttribute(PmsConstant.SESSION_INFO);
		
		if(info!=null && info.getCacheTab()!=null && info.getCacheTab()>0) {
			try {
				dataCacheDao.setExpire(session.getId()+PmsConstant.CACHE_KEYNAME, session.getMaxInactiveInterval());
			} catch (Exception e) {
			}
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
