package com.panfeng.web.wearable.resource.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.util.DateUtils;
import com.paipianwang.pat.common.util.JsonUtil;
import com.paipianwang.pat.common.web.security.AESUtil;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.indent.service.PmsIndentFacade;
import com.paipianwang.pat.facade.product.entity.PmsProduct;
import com.paipianwang.pat.facade.product.entity.PmsService;
import com.paipianwang.pat.facade.product.service.PmsProductFacade;
import com.paipianwang.pat.facade.product.service.PmsServiceFacade;
import com.panfeng.web.wearable.domain.Result;
import com.panfeng.web.wearable.mq.service.SmsMQService;

@RestController
@RequestMapping("/order")
public class IndentController extends BaseController {

	final Logger serLogger = LoggerFactory.getLogger("service"); // service log

	final Logger logger = LoggerFactory.getLogger("error");

	@Autowired
	final private SmsMQService smsMQService = null;

	@Autowired
	final private PmsProductFacade pmsProductFacade = null;

	@Autowired
	final private PmsServiceFacade pmsServiceFacade = null;

	@Autowired
	final private PmsIndentFacade pmsIndentFacade = null;

	/**
	 * 移动端-提交订单
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/phone/submit", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ModelAndView successViewOnPhone(final PmsIndent indent, final HttpServletRequest request)
			throws UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		try {
			String token = indent.getToken();
			// token 解密
			token = AESUtil.Decrypt(token, PmsConstant.ORDER_TOKEN_UNIQUE_KEY);

			final PmsIndent nIndent = JsonUtil.toBean(token, PmsIndent.class);
			indent.setTeamId(nIndent.getTeamId());
			indent.setProductId(nIndent.getProductId());
			indent.setServiceId(nIndent.getServiceId());
			if (StringUtils.isNotBlank(nIndent.getProduct_name())) {
				String productName = nIndent.getProduct_name();
				indent.setIndent_recomment("样片名称:" + productName);
			}

			final long teamId = indent.getTeamId();
			final long productId = indent.getProductId();
			final long serviceId = indent.getServiceId();
			String productName = null;
			// 如果按产品下单，那么下单之后的订单信息需要与数据库进行对比
			if (teamId != -1 && productId != -1 && serviceId != -1) {
				// 产品下单
				final PmsProduct product = pmsProductFacade.findProductById(productId);
				productName = product.getProductName();
				final PmsService ser = pmsServiceFacade.getServiceById(serviceId);
				indent.setSecond(ser.getMcoms());
				indent.setIndentPrice(ser.getServiceRealPrice());
			}

			boolean res = pmsIndentFacade.saveOrder(indent);
			if (res) {
				String telephone = PublicConfig.PHONENUMBER_ORDER;
				if (indent.getSendToStaff()) {
					if (StringUtils.isBlank(productName)) {
						smsMQService.sendMessage("131844", telephone,
								new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【未指定具体影片】" });
					} else {
						smsMQService.sendMessage("131844", telephone,
								new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【" + productName + "】" });
					}
				}
				// 发送短信给用户下单成功
				if (indent.getSendToUser()) {
					smsMQService.sendMessage("131329", indent.getIndent_tele(), null);
				}
				return new ModelAndView("redirect:/success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/error");
	}

	/**
	 * 提交订单-带有短信验证码的 
	 */
	@RequestMapping(value = "/deliver", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Result successView(final PmsIndent indent, final HttpServletRequest request,
			@RequestParam(required = false) String phoneCode) throws UnsupportedEncodingException {
		final Result result = new Result();
		
		final HttpSession session = request.getSession();
		// 判断该用户是否登录
		final SessionInfo info = (SessionInfo) session.getAttribute(PmsConstant.SESSION_INFO);
		boolean flag = false;
		
		if(info != null) {
			// 登录之后，不需要判断验证码
			indent.setIndent_tele(info.getTelephone());
			flag = true;
		} else {
			// 未登录，需要判断验证码
			String code = (String) session.getAttribute("code");
			String codeOfPhone = (String) request.getSession().getAttribute("codeOfphone");
			if (null != phoneCode && phoneCode.equals("-1")) {
				flag = true;
			} else {
				if (null != code && null != codeOfPhone && null != phoneCode && code.equals(phoneCode)
						&& codeOfPhone.equals(indent.getIndent_tele())) {
					flag = true;
				}
			}
		}
		
		if (flag) {
			request.setCharacterEncoding("UTF-8");
			String productName = null;
			final long teamId = indent.getTeamId();
			final long productId = indent.getProductId();
			final long serviceId = indent.getServiceId();
			// 如果按产品下单，那么下单之后的订单信息需要与数据库进行对比
			if (teamId != -1 && productId != -1 && serviceId != -1) {
				// 产品下单
				final PmsProduct product = pmsProductFacade.findProductById(productId);
				productName = product.getProductName();
				final PmsService ser = pmsServiceFacade.getServiceById(serviceId);
				indent.setSecond(ser.getMcoms());
				indent.setIndentPrice(ser.getServiceRealPrice());
			}
			
			// 判断流量是否来自媒体
			final String source_channels = (String) request.getSession().getAttribute(PmsConstant.SOURCE_CHANNELS);
			if(StringUtils.isNotBlank(source_channels)) {
				// 流量来自媒体
				String indentName = "新媒体-" + source_channels;
				if(indent.getIndentName().indexOf("banner") > -1) {
					// 首页banner下单
					indentName += "-直接下单";
				} else if(indent.getIndentName().indexOf("首页-移动") > -1) {
					indentName += productName;
				} 
				indent.setIndentName(indentName);
			}
			boolean res = pmsIndentFacade.saveOrder(indent);
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
		return new Result(false, "验证码有误！");
	}
}
