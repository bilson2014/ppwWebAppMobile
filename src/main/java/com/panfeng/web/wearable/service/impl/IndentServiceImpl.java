package com.panfeng.web.wearable.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.util.DateUtils;
import com.paipianwang.pat.common.util.JsonUtil;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.common.web.security.AESUtil;
import com.paipianwang.pat.facade.indent.entity.IndentSource;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.indent.service.PmsIndentFacade;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.entity.PmsService;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.product.service.PmsServiceFacade;
import com.paipianwang.pat.facade.sales.entity.PmsSalesman;
import com.paipianwang.pat.facade.sales.service.PmsSalesmanFacade;
import com.panfeng.web.wearable.domain.Result;
import com.panfeng.web.wearable.mq.service.SmsMQService;
import com.panfeng.web.wearable.service.IndentService;

@Service
public class IndentServiceImpl implements IndentService {

	final Logger logger = LoggerFactory.getLogger("error");
	@Autowired
	private PmsSalesmanFacade pmsSalesmanFacade = null;
	
	@Autowired
	private final PmsIndentFacade pmsIndentFacade = null;
	
	@Autowired
	private final SmsMQService smsMQService = null;
	
	@Autowired
	final private PmsProductFacade pmsProductFacade = null;

	@Autowired
	final private PmsServiceFacade pmsServiceFacade = null;

	/**
	 * 订单处理 分销/活动
	 */
	@Override
	public Result saveIndent(PmsIndent indent, HttpSession session) {

		Result result=new Result();
		
		//-------------1.token参数处理--------------
		String token = indent.getToken();
		if(ValidateUtil.isValid(token)){
			// token 解密
			try {
				token = AESUtil.Decrypt(token, PmsConstant.ORDER_TOKEN_UNIQUE_KEY);
			} catch (Exception e) {
				e.printStackTrace();
				result.setMessage("信息参数异常");
				return result;
			}

			final PmsIndent nIndent = JsonUtil.toBean(token, PmsIndent.class);
			indent.setTeamId(nIndent.getTeamId());
			indent.setProductId(nIndent.getProductId());
			indent.setServiceId(nIndent.getServiceId());
			if(ValidateUtil.isValid(nIndent.getSalesmanUniqueId())){
				indent.setSalesmanUniqueId(nIndent.getSalesmanUniqueId());
			}
			//备注
			/*if (!ValidateUtil.isValid(indent.getIndent_recomment()) && StringUtils.isNotBlank(nIndent.getProduct_name())) {
				String productName = nIndent.getProduct_name();
				indent.setIndent_recomment("样片名称:" + productName);
			}*/
		}	
		
		//--------------2.产品下单处理-----------------
		String productName = null;
		final long teamId = indent.getTeamId();
		final long productId = indent.getProductId();
		final Long serviceId = indent.getServiceId();
		// 如果按产品下单，那么下单之后的订单信息需要与数据库进行对比
		if (teamId != -1 && productId != -1 && serviceId != null && serviceId != -1) {
			// 产品下单
			final PmsProduct product = pmsProductFacade.findProductById(productId);
			productName = product.getProductName();
			final PmsService ser = pmsServiceFacade.getServiceById(serviceId);
			indent.setSecond(ser.getMcoms());
			indent.setIndentPrice(ser.getServiceRealPrice());
		}else{
			indent.setTeamId(-1);
			indent.setProductId(-1);
			indent.setServiceId(-1l);
		}

		//---------------3.流量来源处理-----------------
		// 判断流量是否来自媒体
		final String source_channels = (String) session.getAttribute(PmsConstant.SOURCE_CHANNELS);
		
		if(ValidateUtil.isValid(indent.getSalesmanUniqueId())){
			//分销/活动配置
			editSalesmanIndent(indent);
		}else if (StringUtils.isNotBlank(source_channels)) {
			// 流量来自媒体
			String indentName = "新媒体-" + source_channels;
			if (indent.getIndentName().indexOf("banner") > -1) {
				// 首页banner下单
				indentName += "-直接下单";
				indent.setIndentSource(IndentSource.wechat_direct.getValue());
			} else if (indent.getIndentName().indexOf("网站-移动") > -1) {
				indentName += productName;
				indent.setIndentSource(IndentSource.wechat_product.getValue());
			}
			indent.setIndentName(indentName);
		}
		
		final String userName = indent.getUser_name();
		// 获取用户姓名
		if(StringUtils.isNotBlank(userName)) {
			indent.setRealName(userName);
			/*if(!ValidateUtil.isValid(indent.getIndent_recomment())){
				indent.setIndent_recomment("联系人:" + userName);
			}
			*/
		}
		
		boolean res = pmsIndentFacade.saveOrder(indent);
		result.setRet(res);
		//---------------4.信息发送 TODO 测试时先关掉---------------
		if (res) {
			result.setRet(true);
			if (indent.getSendToStaff()) {
				if (StringUtils.isBlank(productName)) {
					smsMQService.sendMessage("131844", PublicConfig.PHONENUMBER_ORDER,
							new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【未指定具体影片】" });
				} else {
					smsMQService.sendMessage("131844", PublicConfig.PHONENUMBER_ORDER,
							new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【" + productName + "】" });
				}
			}
			// 发送短信给用户下单成功
			if (indent.getSendToUser()) {
				smsMQService.sendMessage("131329", indent.getIndent_tele(), null);
			}
		}
		return result;
	}

	@Override
	public void editSalesmanIndent(PmsIndent indent) {
		if(!ValidateUtil.isValid(indent.getSalesmanUniqueId())){
			return ;
		}
		final List<PmsSalesman> salesmans = pmsSalesmanFacade.findSalesmanByUniqueId(indent.getSalesmanUniqueId(),PmsSalesman.TYPE_MOBILE);
		if(ValidateUtil.isValid(salesmans)){
			PmsSalesman salesman= salesmans.get(0);
			//订单名称
			indent.setIndentName(salesman.getBelongs()+"-"+salesman.getPlatform()+"-"+salesman.getSalesmanName());
			//订单来源
			if(salesman.getIndentSource()!=null && salesman.getIndentSource()>0){
				indent.setIndentSource(salesman.getIndentSource());
			}
			//订单备注
		}
		
	}
}
