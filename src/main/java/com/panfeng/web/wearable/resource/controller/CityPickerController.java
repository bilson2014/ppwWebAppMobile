package com.panfeng.web.wearable.resource.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paipianwang.pat.facade.team.entity.PmsCity;
import com.paipianwang.pat.facade.team.entity.PmsProvince;
import com.paipianwang.pat.facade.team.service.PmsCityFacade;
import com.paipianwang.pat.facade.team.service.PmsProvinceFacade;

/**
 * 省市二级联动 控制器
 * @author Jack
 * @version 2017-04-05
 *
 */
@RestController
public class CityPickerController extends BaseController {

	@Autowired
	private final PmsProvinceFacade pmsProvinceFacade = null;
	
	@Autowired
	private final PmsCityFacade pmsCityFacade = null;
	
	/**
	 * 获取所有省
	 * @return
	 */
	@RequestMapping("/get/provinces")
	public List<PmsProvince> getAllProvince() {
		return pmsProvinceFacade.getAll();
	}

	/**
	 * 获取所有城市实体
	 * @return
	 */
	@RequestMapping("/all/citys")
	public List<PmsCity> getAll() {
		return pmsCityFacade.getAll();
	}

}
