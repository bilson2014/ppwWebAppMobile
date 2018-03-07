package com.panfeng.web.wearable.service;

import com.panfeng.web.wearable.resource.model.CostCalculate;

public interface CostCalculateService {

	int dealCost(int[][] typeAddTeam,int[][] typeAddEquipment, CostCalculate calculate);
	
	

}
