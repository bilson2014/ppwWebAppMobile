package com.panfeng.web.wearable.service.impl;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;

import com.paipianwang.pat.common.constant.PmsConstant;
import com.panfeng.web.wearable.resource.model.CostCalculate;
import com.panfeng.web.wearable.service.CostCalculateService;

@Service
public class CostCalculateServiceImpl implements CostCalculateService {

	@Override
	public int dealCost(int[][] typeAddTeam, int[][] typeAddEquipment, CostCalculate calculate) {
		int videoType = calculate.getVideoType();
		int team = calculate.getTeam();
		int equipment = calculate.getEquipment();
		int actor = calculate.getActor();
		int animation = calculate.getAnimation();
		int time = calculate.getTime();
		int total = 0;
		total += typeAddTeam[videoType][team];
		// 设备
		if (videoType <= 4) {
			total += typeAddEquipment[0][equipment];
		} else {
			total += typeAddEquipment[1][equipment];
		}

		// 时长-最终百位以下四舍五入
		switch (time) {
		case 0:
			BigDecimal bTotal = new BigDecimal(Integer.valueOf(total));
			BigDecimal cheng = new BigDecimal(Double.valueOf(1.2));
			BigDecimal hundred = new BigDecimal(100);
			total = bTotal.multiply(cheng).divide(hundred).setScale(0, BigDecimal.ROUND_HALF_UP).multiply(hundred)
					.intValue();
			break;
		case 1:
			bTotal = new BigDecimal(Integer.valueOf(total));
			cheng = new BigDecimal(Double.valueOf(1.3));
			hundred = new BigDecimal(100);
			total = bTotal.multiply(cheng).divide(hundred).setScale(0, BigDecimal.ROUND_HALF_UP).multiply(hundred)
					.intValue();
			break;
		case 2:
			bTotal = new BigDecimal(Integer.valueOf(total));
			cheng = new BigDecimal(Double.valueOf(1.5));
			hundred = new BigDecimal(100);
			total = bTotal.multiply(cheng).divide(hundred).setScale(0, BigDecimal.ROUND_HALF_UP).multiply(hundred)
					.intValue();
			break;
		}

		// 演员
		switch (actor) {
		case 1:
			total += 5000;
			break;
		case 2:
			total += 10000;
			break;
		}
		// 动画-配音
		switch (animation) {
		case 1:
			total += 2000;
			break;
		case 2:
			total += 3000;
			break;
		case 3:
			total += 5000;
			break;
		}
		return total;
	}

	public static void main(String[] args) {
		CostCalculate calculate = new CostCalculate();
		// 产品
		calculate.setVideoType(1);
		// 团队
		calculate.setTeam(1);
		// 设备
		calculate.setEquipment(1);
		// 演员
		calculate.setActor(1);
		// 配音
		// calculate.setAnimation(1);

		int core = new CostCalculateServiceImpl().dealCost(PmsConstant.TYPE_ADD_TEAM, PmsConstant.TYPE_ADD_EQUIPMENT,
				calculate);
		System.out.println(core);
	}
}
