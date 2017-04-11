package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.sales.entity.PmsSalesman;
import com.panfeng.web.wearable.domain.Result;
import com.panfeng.web.wearable.security.AESUtil;
import com.panfeng.web.wearable.util.HttpUtil;
import com.panfeng.web.wearable.util.IndentUtil;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
public class SalesmanController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log
	
	final Logger logger = LoggerFactory.getLogger("error");
	
	/**
	 * 手机分销人直接下单页
	 */
	@RequestMapping("/salesman/order/{uniqueId}")
	public ModelAndView orderView(@PathVariable("uniqueId") final String uniqueId,final HttpServletRequest request,final ModelMap model){
		
		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if(isValid(request, salesman)){
			
			final PmsIndent indent = new PmsIndent();
			indent.setTeamId(-1l);
			indent.setProductId(-1l);
			indent.setServiceId(-1l);
			indent.setSalesmanUniqueId(uniqueId);
			
			try {
				final String token = IndentUtil.generateOrderToken(request, indent);
				model.addAttribute("token",token);
			} catch (Exception e) {
				logger.error("method SalesmanController orderView ,order page has error,bacase generate order use AES Decrypt token error ...");
				e.printStackTrace();
			}
			
			return new ModelAndView("/salesman/order", model);
		}
		
		return new ModelAndView("/salesman/error");
	}
	
	/**
	 * 手机分销人直接下单页
	 */
	@RequestMapping("/salesman/order/{productId}/{uniqueId}")
	public ModelAndView orderView(@PathVariable("productId") final Long productId, @PathVariable("uniqueId") final String uniqueId,final ModelMap model,final HttpServletRequest request){
		
		
		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if(isValid(request, salesman)){
			
			final String url = PublicConfig.URL_PREFIX + "portal/product/static/information/" + productId;
			String json = HttpUtil.httpGet(url, request);
			PmsProduct product = null;
			if(ValidateUtil.isValid(json)){
				product = JsonUtil.toBean(json, PmsProduct.class);
			}
			try {
				final PmsIndent indent = new PmsIndent();
				indent.setTeamId(product.getTeamId());
				indent.setProductId(product.getProductId());
				indent.setServiceId(product.getServiceId());
				indent.setSalesmanUniqueId(uniqueId);
				final String token = IndentUtil.generateOrderToken(request, indent);
				
				model.addAttribute("token", token);
				model.addAttribute("recomment", "样片名称:"+product.getProductName()+",价格:"+product.getServiceRealPrice());
			} catch (Exception e) {
				logger.error("method SalesmanController orderView ,order page has error,bacase generate order use AES Decrypt token error ...");
				e.printStackTrace();
			}
			return new ModelAndView("/salesman/order", model);
		}
		
		return new ModelAndView("/salesman/error", model); 
	}
	
	/**
	 * 分销人移动端-提交订单
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/salesman/order/submit", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ModelAndView successViewOnPhone(final PmsIndent indent,final HttpServletRequest request,final ModelMap model) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		final String url = PublicConfig.URL_PREFIX + "portal/indent/order";
		try {
			indent.setIndentName(URLEncoder.encode(indent.getIndentName(), "UTF-8"));
			// add by Jack,2016-06-22 19:45 begin
			// -> to promote security for order
			String token = indent.getToken();
			// token 解密
			token = AESUtil.Decrypt(token, PmsConstant.ORDER_TOKEN_UNIQUE_KEY);
			final PmsIndent nIndent = JsonUtil.toBean(token, PmsIndent.class);
			if(!HasDigit(nIndent.getSalesmanUniqueId())){//代表微信 今日头条等特定人
				indent.setIndentName(indent.getIndentName()+"("+nIndent.getSalesmanUniqueId()+")");
			}
			if(StringUtils.isNotBlank(indent.getIndent_recomment())){
				indent.setIndent_recomment(URLEncoder.encode(indent.getIndent_recomment(), "UTF-8"));
			}
			indent.setTeamId(nIndent.getTeamId());
			indent.setProductId(nIndent.getProductId());
			indent.setServiceId(nIndent.getServiceId());
			indent.setSalesmanUniqueId(nIndent.getSalesmanUniqueId());
			String str = HttpUtil.httpPost(url, indent,request);
			if(str != null && !"".equals(str)){
				final Result result = JsonUtil.toBean(str, Result.class);
				
				if(result.isRet()){
					model.addAttribute("uniqueId", indent.getSalesmanUniqueId());
					return new ModelAndView("/salesman/success");
				}
			}
		} catch (Exception e) {
			logger.error("SalesmanController method:successViewOnPhone() Order encode Failure ...");
			e.printStackTrace();
		}
		return new ModelAndView("/salesman/error");
	}
	
	@RequestMapping("/salesman/{uniqueId}")
	public ModelAndView page(@PathVariable("uniqueId") final String uniqueId,final ModelMap model,final HttpServletRequest request){
		
		// 判断uniqueId是否合法
		final PmsSalesman salesman = new PmsSalesman();
		salesman.setUniqueId(uniqueId);
		if(isValid(request, salesman)){
			
			model.addAttribute("uniqueId", uniqueId);
			return new ModelAndView("/salesman/portal");
		}
		
		// 跳转至分销人的错误页面上来
		return new ModelAndView("/salesman/error");
		
	}
	
	@RequestMapping("/salesman/load/product")
	public List<PmsProduct> loadSalesProduct(final HttpServletRequest request){
		
		final String url = PublicConfig.URL_PREFIX + "portal/product/static/data/salesproduct";
		final String json = HttpUtil.httpGet(url, request);
		if(ValidateUtil.isValid(json)){
			try {
				final List<PmsProduct> list = JsonUtil.fromJsonArray(json, PmsProduct.class);
				return list;
			} catch (Exception e) {
				logger.error("Load PmsSalesman product error ...");
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	public boolean isValid(final HttpServletRequest request,final PmsSalesman salesman){
		
		// 判断uniqueId是否合法
		final String url = PublicConfig.URL_PREFIX + "portal/salesman/valid";
		final String str = HttpUtil.httpPost(url, salesman, request);
		if(ValidateUtil.isValid(str)){
			Boolean result = JsonUtil.toBean(str, Boolean.class);
			if(result)
				return true;
		}
		
		return false;
	}
	
	// 判断一个字符串是否含有数字
	public boolean HasDigit(String content) {
	    boolean flag = false;
	    Pattern p = Pattern.compile(".*\\d+.*");
	    Matcher m = p.matcher(content);
	    if (m.matches()) {
	        flag = true;
	    }
	    return flag;
	}
	
	/**
	 * mg
	 */
	@RequestMapping("/mgtoutiao")
	public ModelAndView orderView(final HttpServletRequest request,final ModelMap model){
			
			final PmsIndent indent = new PmsIndent();
			indent.setTeamId(-1l);
			indent.setProductId(-1l);
			indent.setServiceId(-1l);
			indent.setSalesmanUniqueId("MG活动下单");
			try {
				final String token = IndentUtil.generateOrderToken(request, indent);
				model.addAttribute("token",token);
			} catch (Exception e) {
				logger.error("method SalesmanController orderView ,order page has error,bacase generate order use AES Decrypt token error ...");
				e.printStackTrace();
			}
			// modify by Jack,2016-06-23 10:28 end

			return new ModelAndView("/salesman/mgActive", model);
		
	}
}
