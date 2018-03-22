package com.panfeng.web.wearable.resource.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paipianwang.pat.facade.right.entity.PmsEmployee;
import com.paipianwang.pat.facade.right.service.PmsEmployeeFacade;

/**
 * 权限用户管理 
 *
 */

@RestController
@RequestMapping("/employee")
public class EmployeeController extends BaseController {

	@Autowired
	private final PmsEmployeeFacade pmsEmployeeFacade = null;

	/**
	 * 微信小程序-获取内部员工
	 * @return
	 */
	/*@RequestMapping("/findMP")
	public List<PmsEmployee> getEmployeeListForMP(String name){
		Map<String,Object> paramMap=new HashMap<>();
		paramMap.put("employeeRealName",name);
		final List<PmsEmployee> list = pmsEmployeeFacade.findEmployeeForMP(paramMap);
		return list;
	}*/

}
