package com.panfeng.web.wearable.resource.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.resource.model.DealLog;
import com.panfeng.web.wearable.util.HttpsUtils;
import com.panfeng.web.wearable.util.JsonUtil;

@RestController
@RequestMapping("/pay")
public class PayController extends BaseController {
	static String RETURN_KEY = "billNo";
	static String RESULT_KEY = "result";

	@RequestMapping("/get/billno")
	public DealLog getBillNo(@RequestBody Map<String, String> id, final HttpServletRequest request) {
		final String url = PublicConfig.URL_HTTPS_PREFIX + "pay/get/billno";
		String str = HttpsUtils.httpsPost(url, id, request, true);

		if (str != null && !"".equals(str)) {
			return JsonUtil.toBean(str, DealLog.class);
		}
		return new DealLog();
	}

	@RequestMapping("/error")
	public ModelAndView error() {
		return new ModelAndView("error");
	}

	@RequestMapping(value = "/get/deallogs", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public List<DealLog> getDealLogByProject(@RequestBody Map<String, String> projectId,
			final HttpServletRequest request) {
		final SessionInfo info = getCurrentInfo(request);
		Long userid = info.getReqiureId();
		String userType = info.getSessionType();
		projectId.put("userid", userid.toString());
		projectId.put("userType", userType);
		final String url = PublicConfig.URL_HTTPS_PREFIX + "pay/get/deallogs";
		String str = HttpsUtils.httpsPost(url, projectId, request, true);
		if (str != null && !"".equals(str)) {
			return JsonUtil.toList(str);
		} else {
			return new ArrayList<>();
		}
	}

	@RequestMapping(value = "/sendpay", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public BaseMsg sendPay(@RequestBody DealLog dealLog, final HttpServletRequest request) {
		final String url = PublicConfig.URL_HTTPS_PREFIX + "pay/sendpay";
		String str = HttpsUtils.httpsPost(url, dealLog, request, true);

		if (str != null && !"".equals(str)) {
			BaseMsg baseMsg = JsonUtil.toBean(str, BaseMsg.class);
			// 数据正常添加url前缀
			if (baseMsg.getErrorCode() == BaseMsg.NORMAL) {
				String token = (String) baseMsg.getResult();
				String urlview = "/pay/shareview?token=" + token;
				baseMsg.setResult(urlview);
				return baseMsg;
			}
		}

		return new BaseMsg(BaseMsg.ERROR, "发起失败", null);
	}

	@RequestMapping("/shareview")
	public ModelAndView shareView(String token, final HttpServletRequest request, final ModelMap model) {
		// 去后台检查，页面的合法性
		final String url = PublicConfig.URL_HTTPS_PREFIX + "pay/get/orderview?token=" + token;
		String str = HttpsUtils.httpsGet(url, request, true);
		if (str != null && !"".equals(str)) {
			DealLog dealLog = JsonUtil.toBean(str, DealLog.class);
			model.put("dealLog", dealLog);
			return new ModelAndView("/payment/payList", model);
		}
		return new ModelAndView("error");
	}

	@RequestMapping("/offline/save")
	public BaseMsg offlineSave(@RequestBody DealLog dealLog, final HttpServletRequest request) {
		final String url = PublicConfig.URL_HTTPS_PREFIX + "pay/offline/save";
		String str = HttpsUtils.httpsPost(url, dealLog, request, true);
		if (str != null && !"".equals(str)) {
			BaseMsg baseMsg = JsonUtil.toBean(str, BaseMsg.class);
			// 数据正常添加url前缀
			return baseMsg;
		} else {
			return new BaseMsg(BaseMsg.ERROR, "服务器繁忙", "");
		}
	}

}
