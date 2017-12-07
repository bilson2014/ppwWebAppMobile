package com.panfeng.web.wearable.resource.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.constant.PmsConstant;
import com.paipianwang.pat.common.util.DateUtils;
import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.paipianwang.pat.facade.indent.service.PmsIndentFacade;
import com.paipianwang.pat.facade.sales.entity.PmsSalesman;
import com.paipianwang.pat.facade.sales.service.PmsSalesmanFacade;
import com.panfeng.web.wearable.mq.service.SmsMQService;
import com.panfeng.web.wearable.resource.model.CostCalculate;
import com.panfeng.web.wearable.service.CostCalculateService;

/**
 * 活动控制器
 * 负责活动的跳转
 * @author Jack
 *
 */
@RestController
@RequestMapping("/activity")
public class ActivityController extends BaseController{

	@Autowired
	private CostCalculateService calculateService = null;
	
	@Autowired
	private PmsSalesmanFacade pmsSalesmanFacade = null;
	
	@Autowired
	private final PmsIndentFacade pmsIndentFacade = null;
	
	@Autowired
	private final SmsMQService smsMQService = null;
	
	/**
	 * 渠道-成本计算器下单
	 * @param uniqueId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/calculate/view/{uniqueId}")
	public ModelAndView costPage(@PathVariable("uniqueId") final String uniqueId,final ModelMap model) {
		
		if(StringUtils.isNotBlank(uniqueId)) {
			// 验证uniqueId是否合法
			if(isValid(uniqueId)) {
				model.addAttribute("uniqueId", uniqueId);
				return new ModelAndView("/activity/caculate/costcalculate");
			}
		}
		return new ModelAndView("/activity/error");
	}
	
	/**
	 * 成本计算器活动-计算器下单
	 * @param calculate 计算元素
	 * @param uniqueId 活动唯一标识
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/calculate/result")
	public Map<String, Object> costCalculate(@RequestBody CostCalculate calculate,HttpServletRequest request){
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
		int cost = calculateService.dealCost(PmsConstant.TYPE_ADD_TEAM,PmsConstant.TYPE_ADD_EQUIPMENT,calculate);
		map.put("cost", cost);
		//提交订单
		PmsIndent indent = new PmsIndent();
		indent.setIndent_tele(calculate.getPhone());
		indent.setIndentId(calculate.getIndentId());
		indent.setId(calculate.getIndentId());
		
		String indentName = "活动-";
		String targetName = "未知";
		final String uniqueId = calculate.getTarget();
		if(StringUtils.isNotBlank(uniqueId)) {
			PmsSalesman pmsSalesman = pmsSalesmanFacade.findSalesmanByUniqueId(uniqueId);
			targetName = pmsSalesman == null ? null : pmsSalesman.getSalesmanName();
			indent.setSalesmanName(pmsSalesman.getSalesmanName());
			indent.setSalesmanUniqueId(uniqueId);
		}
		
		indent.setIndentName(indentName + targetName);
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
	
	/**
	 * 验证uniqueId是否合法
	 * @param request
	 * @param salesman
	 * @return
	 */
	public boolean isValid(final String uniqueId) {
		final PmsSalesman saleman = pmsSalesmanFacade.findSalesmanByUniqueId(uniqueId);
		return saleman == null ? false : true;
	}
	
	/**
	 * MG活动
	 * @param uniqueId
	 * @param model
	 * @return
	 */
	@RequestMapping("/mg/{uniqueId}")
	public ModelAndView mgView(@PathVariable("uniqueId") final String uniqueId,final ModelMap model) {
		if(StringUtils.isNotBlank(uniqueId)) {
			model.addAttribute("uniqueId",uniqueId);
			return new ModelAndView("/activity/mg/mg",model);
		}
		
		return new ModelAndView("/activity/error");
	}
	
	@RequestMapping(value = "/mg/submit", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ModelAndView mgResultView(final PmsIndent pmsIndent) {
		// 下单人员手机号码
		final String userPhone = pmsIndent.getIndent_tele();
		if(StringUtils.isNotBlank(userPhone)) {
			final String uniqueId = pmsIndent.getSalesmanUniqueId();
			
			String indentName = "活动-";
			String targetName = "未知";
			if(StringUtils.isNotBlank(uniqueId)) {
				// 获取 活动信息
				final PmsSalesman salesman = pmsSalesmanFacade.findSalesmanByUniqueId(uniqueId);
				// 组装活动名称
				targetName = salesman.getSalesmanName();
				pmsIndent.setSalesmanUniqueId(uniqueId);
				pmsIndent.setSalesmanName(salesman.getSalesmanName());
			}
			final String userName = pmsIndent.getUser_name();
			// 获取用户姓名
			if(StringUtils.isNotBlank(userName)) {
				pmsIndent.setUser_name(userName);
				pmsIndent.setIndent_recomment("联系人:" + userName);
			}
			pmsIndent.setIndentName(indentName + targetName);
			pmsIndent.setTeamId(-1);
			pmsIndent.setProductId(-1);
			pmsIndent.setServiceId(-1l);
			boolean ret = pmsIndentFacade.saveOrder(pmsIndent);
			if(ret) {
				// 发送短信
				// 内部员工通知下单手机号码
				final String eTel = PublicConfig.PHONENUMBER_ORDER;
				
				// 发送短信通知内部员工有新订单
				smsMQService.sendMessage("131844", eTel,
						new String[] { userPhone, DateUtils.nowTime(), "【未指定具体影片】" });
				
				// 发送短信给用户下单成功
				smsMQService.sendMessage("131329", userPhone, null);
				return new ModelAndView("/activity/success");
			}
		}
		return new ModelAndView("/activity/error");
	}
}
