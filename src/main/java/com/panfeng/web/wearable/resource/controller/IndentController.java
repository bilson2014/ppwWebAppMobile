package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.panfeng.web.wearable.domain.Result;
import com.panfeng.web.wearable.security.AESUtil;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
@RequestMapping("/order")
public class IndentController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log
	
	final Logger logger = LoggerFactory.getLogger("error");
	
	/**
	 * 移动端-提交订单
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/phone/submit", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ModelAndView successViewOnPhone(final PmsIndent indent,final HttpServletRequest request) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		final String url = PublicConfig.URL_PREFIX + "portal/indent/order";
		try {
			if(indent.getIndent_recomment() != null && !"".equals(indent.getIndent_recomment())) {
				indent.setIndent_recomment(URLEncoder.encode(indent.getIndent_recomment(), "UTF-8"));
			}
			
			String token = indent.getToken();
			// token 解密
			token = AESUtil.Decrypt(token, PmsConstant.ORDER_TOKEN_UNIQUE_KEY);
			
			final PmsIndent nIndent = JsonUtil.toBean(token, PmsIndent.class);
			indent.setTeamId(nIndent.getTeamId());
			indent.setProductId(nIndent.getProductId());
			indent.setServiceId(nIndent.getServiceId());
			if(StringUtils.isNotBlank(nIndent.getProduct_name())){
				String productName =nIndent.getProduct_name();
				indent.setIndent_recomment("样片名称:" + productName);
			}
			String str = HttpUtil.httpPost(url, indent,request);
			// 更改为Dubbo下单方式
			if(str != null && !"".equals(str)){
				final Result result = JsonUtil.toBean(str, Result.class);
				if(result.isRet()){
					return new ModelAndView("redirect:/success");
				}
			}
		} catch (Exception e) {
			logger.error("IndentController method:successViewOnPhone() Order encode Failure ...");
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/error");
	}
	
}
