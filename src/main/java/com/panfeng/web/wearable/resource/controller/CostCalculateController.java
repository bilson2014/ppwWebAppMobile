package com.panfeng.web.wearable.resource.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.entity.SessionInfo;
import com.paipianwang.pat.common.util.DateUtils;
import com.paipianwang.pat.facade.indent.entity.IndentSource;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.indent.service.PmsIndentFacade;
import com.panfeng.web.wearable.mq.service.SmsMQService;
import com.panfeng.web.wearable.resource.model.CostCalculate;
import com.panfeng.web.wearable.service.CostCalculateService;

/**
 * 成本计算控制器
 */
@RestController
@RequestMapping("/calculate")
public class CostCalculateController extends BaseController {

	@Autowired
	private CostCalculateService calculateService;
	
	@Autowired
	private final PmsIndentFacade pmsIndentFacade = null;
	
	@Autowired
	private final SmsMQService smsMQService = null;

	@RequestMapping(value="/cost")
	public Map<String, Object> costCalculate(@RequestBody CostCalculate calculate,
			HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		
		final HttpSession session = request.getSession();
		// 判断该用户是否登录
		final SessionInfo info = (SessionInfo) session.getAttribute(PmsConstant.SESSION_INFO);
		final String codeOfphone = (String) request.getSession().getAttribute("codeOfphone");
		
		if(calculate.getIndentId() == 0){//首次计算
			if(info == null) {
				// 未登录，则需要验证短信验证码
				final String code = (String) request.getSession().getAttribute("code");
				if(StringUtils.isBlank(code) || StringUtils.isBlank(codeOfphone)){
					map.put("code", 0);
					map.put("msg", "请重新获取验证码");
					return map;
				}
				if(!code.equals(calculate.getVerification_code())){
					map.put("code", 0);
					map.put("msg", "验证码错误");
					return map;
				}
				if(!codeOfphone.equals(calculate.getPhone())){
					map.put("code", 0);
					map.put("msg", "手机号不匹配");
					return map;
				}
			}
		}
		map.put("code", 1);
		int cost = calculateService.dealCost(PmsConstant.TYPE_ADD_TEAM,PmsConstant.TYPE_ADD_EQUIPMENT,calculate);
		map.put("cost", cost);
		//提交订单
		PmsIndent indent = new PmsIndent();
		
		if(info == null){
			indent.setIndent_tele(codeOfphone == null ? calculate.getPhone() : codeOfphone);
		}else{
			final String telephone = info.getTelephone();
			indent.setIndent_tele(telephone == null ? calculate.getPhone() : telephone);
			String sessionType = info.getSessionType();
			String indent_recomment = indent.getIndent_recomment();
			//供应商和内部员工不新建订单
			switch (sessionType) {
			case PmsConstant.ROLE_PROVIDER:
				indent_recomment = "供应商  " + indent_recomment;
				return map;
			case PmsConstant.ROLE_EMPLOYEE:
				indent_recomment = "内部员工   "+ indent_recomment;
				return map;
			}
			indent.setIndent_recomment(indent_recomment);
		}
		indent.setIndentId(calculate.getIndentId());
		indent.setId(calculate.getIndentId());
		
		String indentName = calculate.getIndentName();
		indent.setIndentSource(calculate.getIndentSource());
		indent.setIndentName((StringUtils.isNotEmpty(indentName) ? indentName : "网站-移动-成本计算器"));
		indent.setIndentType(0);
		indent.setServiceId(-1l);
		indent.setIndentPrice(0d);
		indent.setProductId(-1);
		indent.setTeamId(-1);
		indent.setSecond(0l);
		indent.setProductId(-1l);
		indent.setIndentNum(" ");
		indent.setIndent_recomment(calculate.getDescription()+",预期金额:"+cost);
		
		// 判断流量是否来自媒体
		final String source_channels = (String) request.getSession().getAttribute(PmsConstant.SOURCE_CHANNELS);
		if(StringUtils.isNotBlank(source_channels)) {
			// 流量来自媒体
			indentName = "新媒体-" + source_channels + "-成本计算器";
			indent.setIndentName(indentName);
			indent.setIndentSource(IndentSource.wechat_cost.getValue());
		}
		
		long indentId = 0;
		if (indent.getId() == 0) {
			indentId = pmsIndentFacade.save(indent);
			indent.setId(indentId);
			String eTele = PublicConfig.PHONENUMBER_ORDER;
			smsMQService.sendMessage("131844", eTele,
					new String[] { indent.getIndent_tele(), DateUtils.nowTime(), "【未指定具体影片】" });
		}else{
			pmsIndentFacade.updateForCalculate(indent);
		}
		map.put("indentId", indent.getId());
 		return map;
	}

	@RequestMapping(value = "/cost2")
	public Map<String, Object> costCalculate2(@RequestBody CostCalculate calculate, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("code", 1);
		int cost = calculateService.dealCost(PmsConstant.TYPE_ADD_TEAM,PmsConstant.TYPE_ADD_EQUIPMENT, calculate);
		map.put("cost", cost);
		return map;
	}
}
