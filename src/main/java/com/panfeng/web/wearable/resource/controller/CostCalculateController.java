package com.panfeng.web.wearable.resource.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.util.DateUtils;
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
	/**
	 * 视频类别 专业级导演团队（3-5）默认 广告级导演团队（5-8） 电影级导演团队（8-10） 活动视频1 ￥ 30,000.00 ￥
	 * 60,000.00 ￥ 100,000.00 产品广告 ￥ 60,000.00 ￥ 100,000.00 ￥ 200,000.00 企业宣传 ￥
	 * 30,000.00 ￥ 60,000.00 ￥ 100,000.00 微电影 ￥ 60,000.00 ￥ 100,000.00 ￥
	 * 200,000.00 融资路演 ￥ 30,000.00 ￥ 60,000.00 ￥ 100,000.00 众筹视频 ￥ 30,000.00 ￥
	 * 60,000.00 ￥ 100,000.00
	 */
	public static int[][] typeAddTeam = new int[6][3];// 初始化6行3列的 视频+导演价格表
	static {
		typeAddTeam[0][0] = 30000;
		typeAddTeam[0][1] = 60000;
		typeAddTeam[0][2] = 100000;
		typeAddTeam[1][0] = 60000;
		typeAddTeam[1][1] = 100000;
		typeAddTeam[1][2] = 200000;
		typeAddTeam[2][0] = 30000;
		typeAddTeam[2][1] = 60000;
		typeAddTeam[2][2] = 100000;
		typeAddTeam[3][0] = 60000;
		typeAddTeam[3][1] = 100000;
		typeAddTeam[3][2] = 200000;
		typeAddTeam[4][0] = 30000;
		typeAddTeam[4][1] = 60000;
		typeAddTeam[4][2] = 100000;
		typeAddTeam[5][0] = 30000;
		typeAddTeam[5][1] = 60000;
		typeAddTeam[5][2] = 100000;
	}

	@RequestMapping(value="/cost")
	public Map<String, Object> costCalculate(@RequestBody CostCalculate calculate,
			HttpServletRequest request){
		String target = "";
		Map<String, Object> map = new HashMap<>();
		if(calculate.getIndentId() == 0){//首次计算
			final String code = (String) request.getSession().getAttribute("code");
			final String codeOfphone = (String) request.getSession().getAttribute("codeOfphone");
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
		map.put("code", 1);
		int cost = calculateService.dealCost(typeAddTeam,calculate);
		map.put("cost", cost);
		//提交订单
		PmsIndent indent = new PmsIndent();
		indent.setIndent_tele(calculate.getPhone());
		indent.setIndentId(calculate.getIndentId());
		indent.setId(calculate.getIndentId());
		if(StringUtils.isNotBlank(calculate.getTarget())){
			target = "-("+calculate.getTarget()+")";
		}
		String indentName = indent.getIndentName();
		indent.setIndentName((StringUtils.isNotEmpty(indentName) ? indentName : "手机端成本计算器下单")+target);
		indent.setIndentType(0);
		indent.setServiceId(-1l);
		indent.setIndentPrice(0d);
		indent.setProductId(-1);
		indent.setTeamId(-1);
		indent.setSecond(0l);
		indent.setProductId(-1l);
		indent.setIndentNum(" ");
		indent.setIndent_recomment(calculate.getDescription()+",预期金额:"+cost);
		
		long indentId = 0;
		if (indent.getId() == 0) {
			indentId = pmsIndentFacade.save(indent);
			indent.setId(indentId);
			String telephone = PublicConfig.PHONENUMBER_ORDER;
			smsMQService.sendMessage("131844", telephone,
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
		int cost = calculateService.dealCost(typeAddTeam, calculate);
		map.put("cost", cost);
		return map;
	}
}
