package com.panfeng.web.wearable.resource.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paipianwang.pat.common.config.PublicConfig;
import com.paipianwang.pat.common.entity.DataGrid;
import com.paipianwang.pat.common.entity.KeyValue;
import com.paipianwang.pat.common.util.ValidateUtil;
import com.paipianwang.pat.facade.product.entity.PmsChanPin;
import com.paipianwang.pat.facade.product.service.PmsChanPinFacade;
import com.paipianwang.pat.workflow.entity.PmsContinuity;
import com.paipianwang.pat.workflow.entity.PmsProductionInfo;
import com.paipianwang.pat.workflow.entity.PmsProjectFlow;
import com.paipianwang.pat.workflow.entity.PmsQuotation;
import com.paipianwang.pat.workflow.entity.PmsQuotationType;
import com.paipianwang.pat.workflow.entity.PmsSchedule;
import com.paipianwang.pat.workflow.enums.ProductionResource;
import com.paipianwang.pat.workflow.facade.PmsContinuityFacade;
import com.paipianwang.pat.workflow.facade.PmsProductionInfoFacade;
import com.paipianwang.pat.workflow.facade.PmsProjectFlowFacade;
import com.paipianwang.pat.workflow.facade.PmsQuotationFacade;
import com.paipianwang.pat.workflow.facade.PmsQuotationTypeFacade;
import com.paipianwang.pat.workflow.facade.PmsScheduleFacade;
import com.panfeng.web.wearable.domain.BaseMsg;
import com.panfeng.web.wearable.domain.ProjectInfo;

/**
 * 微信小程序接口
 * 
 * @author rui 经过一个Controller，以便于后期权限控制
 */
@RestController
@RequestMapping("/miniprogram")
public class MiniProgramController {
	@Autowired
	private PmsProjectFlowFacade pmsProjectFlowFacade;
	@Autowired
	private PmsScheduleFacade pmsScheduleFacade;
	@Autowired
	private PmsQuotationFacade pmsQuotationFacade;
	@Autowired
	private PmsContinuityFacade pmsContinuityFacade;
	@Autowired
	private PmsProductionInfoFacade pmsProductionInfoFacade;
	@Autowired
	private PmsChanPinFacade pmsChanPinFacade;
	@Autowired
	private PmsQuotationTypeFacade pmsQuotationTypeFacade;

	/**
	 * 根据projectId获取项目信息
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/project/info")
	public BaseMsg getProjectInfo(@RequestBody final ProjectInfo project, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		List<String> metaData=new ArrayList<>();
		metaData.add("projectId");
		metaData.add("productId");
		metaData.add("projectBudget");
		metaData.add("projectName");
		metaData.add("projectStage");
		PmsProjectFlow flow = pmsProjectFlowFacade.getProjectFlowByProjectId(metaData, project.getProjectId());
		
		if(flow==null) {
			msg.setCode(BaseMsg.ERROR);
			msg.setResult("数据已过期");
			return msg;
		}
		
		ProjectInfo info = new ProjectInfo();
		
		info.setProjectId(flow.getProjectId());
		info.setProjectName(flow.getProjectName());
		info.setProductId(flow.getProductId());
		
		if(flow.getProductId().equals(0)) {
			info.setProductName("非标准化产品");
		}else {
			PmsChanPin chanpin=pmsChanPinFacade.getChanPinInfo(flow.getProductId());
			if(chanpin!=null) {
				info.setProductName(chanpin.getChanpinName());
			}
		}
		
		
		PmsSchedule schedule = pmsScheduleFacade.getByProjectId(project.getProjectId());
		//TODO 修改获取项目交付日期（维护排期表后保存最终时间为项目交付日期）
		if (schedule != null && ValidateUtil.isValid(schedule.getItems())) {
			info.setDeliveryDate(schedule.getItems().get(schedule.getItems().size()-1).getStart());//交付日期
		}
		PmsQuotation pmsQuotation = pmsQuotationFacade.getByProjectId(project.getProjectId());
		if (pmsQuotation!=null) {
			info.setQuotation(pmsQuotation.getTotal());
		}		
		info.setProjectStage(flow.getProjectStage());
		
		info.setFilmDestPath(ValidateUtil.isValid(flow.getFilmDestPath()) ? flow.getFilmDestPath() : "");
		
		info.setHasContinuity(0);		
		info.setHasProduction(0);

		long count = pmsContinuityFacade.countByProjectId(project.getProjectId());
		if (count > 0) {
			info.setHasContinuity(1);
		}
		count = pmsProductionInfoFacade.countByProjectId(project.getProjectId());
		if (count > 0) {
			info.setHasProduction(1);
		}	

		
		msg.setResult(info);
		return msg;
	}

	@RequestMapping(value = "/resource_path")
	public BaseMsg getResourcePath(final HttpServletRequest request) {
		
		return new BaseMsg(BaseMsg.NORMAL, PublicConfig.FDFS_URL);
	}
	/**
	 * 所有产品(数据字典)
	 * 			+非标准化产品
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/chanpin/list")
	public BaseMsg getProductList(final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		// 产品
		DataGrid<PmsChanPin> allScene = pmsChanPinFacade.getAllChanPin();
		List<KeyValue> chanpin = new ArrayList<>();
		for (PmsChanPin pmsChanpin : allScene.getRows()) {
			KeyValue each = new KeyValue();
			each.setKey(pmsChanpin.getChanpinId() + "");
			each.setValue(pmsChanpin.getChanpinName());
			chanpin.add(each);
		}
		if (ValidateUtil.isValid(chanpin)) {
			msg.setResult(chanpin);
		} else {
			msg.setCode(BaseMsg.ERROR);
		}

		return msg;
	}

	/**
	 * 获取项目阶段（数据字典）
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/project/stages")
	public BaseMsg getProjectStage(final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		
		List<KeyValue> stages = new ArrayList<>();
		
		KeyValue each = new KeyValue();
		each.setKey("1");
		each.setValue("沟通阶段");
		stages.add(each);
		
		each = new KeyValue();
		each.setKey("2");
		each.setValue("方案阶段");
		stages.add(each);
		
		each = new KeyValue();
		each.setKey("3");
		each.setValue("商务阶段");
		stages.add(each);
		
		each = new KeyValue();
		each.setKey("4");
		each.setValue("制作阶段");
		stages.add(each);
		
		each = new KeyValue();
		each.setKey("5");
		each.setValue("交付阶段");
		stages.add(each);
		msg.setResult(stages);

		return msg;
	}

	/**
	 * 根据projectId获取项目排期表
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/schedule/info")
	public BaseMsg getScheduleInfo(@RequestBody final ProjectInfo project, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		PmsSchedule schedule = pmsScheduleFacade.getByProjectId(project.getProjectId());
		if (schedule != null) {
			msg.setResult(schedule);
		} else {
			msg.setCode(BaseMsg.ERROR);
		}

		return msg;
	}

	/**
	 * 根据projectId 获取项目报价单
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/quotation/info")
	public BaseMsg getQuotationInfo(@RequestBody final ProjectInfo project, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		PmsQuotation quotation = pmsQuotationFacade.getByProjectId(project.getProjectId());
		if (quotation != null) {
			msg.setResult(quotation);
		} else {
			msg.setCode(BaseMsg.ERROR);
		}
		return msg;
	}
	
	/**
	 * 根据projectId 获取项目制片
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/production/info")
	public BaseMsg getProductionInfo(@RequestBody final ProjectInfo project, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		PmsProductionInfo production = pmsProductionInfoFacade.getByProjectId(project.getProjectId());
		
		if (production != null) {
			//editQuotationTypeName(production);
			for (PmsProductionInfo.ProductionResource resource : production.getResources()) {
				resource.setPicScale(ProductionResource.getEnum(resource.getType()).getPicScale());
			}
			
			msg.setResult(production);
		} else {
			msg.setCode(BaseMsg.ERROR);
		}
		return msg;
	}
	/*private void editQuotationTypeName(PmsProductionInfo info) {
		if (!ValidateUtil.isValid(info.getResources())) {
			return;
		}
		
		List<PmsQuotationType> types=new ArrayList<>();
		for(Long quotationId:ProductionResource.device.getQuotationType()) {
			types.addAll(pmsQuotationTypeFacade.findByParent(quotationId));
		}
		
		List<PmsQuotationType> types = pmsQuotationTypeFacade.findAll();
		for (PmsQuotationType type : types) {
			if(type.getParentId()==null) {
				continue;
			}
			for (PmsQuotationType parent : types) {
				if (type.getParentId().equals(parent.getTypeId())) {
					type.setParent(parent);
					break;
				}
			}
		}
		// 相同类型集合
		for (PmsProductionInfo.ProductionResource resource : info.getResources()) {
			for (PmsQuotationType type : types) {
				if (type.getTypeId().equals(resource.getTypeId())) {

					resource.setTypeName(type.getTypeName());
					resource.setCategory(type.getParent().getParent().getTypeName());
					resource.setCategoryId(type.getParent().getParent().getTypeId());
					resource.setSubType(type.getParent().getTypeName());
					resource.setSubTypeId(type.getParentId());

					if (ProductionResource.device.getKey().equals(resource.getType())) {
						resource.setMainPhoto(type.getPhoto());
					}

					break;
				}
			}
		}
	}*/
	
	/**
	 * 根据projectId获取分镜头脚本
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/continuity/info")
	public BaseMsg getContinuityInfo(@RequestBody final ProjectInfo project, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		
		PmsContinuity continuity=pmsContinuityFacade.getByProjectId(project.getProjectId());
		if (continuity != null) {
			msg.setResult(continuity);
		} else {
			msg.setCode(BaseMsg.ERROR);
		}
		
		return msg;
	}
	
	/**
	 * 根据 projectId 获取项目历史 TODO 
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/project/history")
	public BaseMsg getProjectHistory(@RequestBody final ProjectInfo project, final HttpServletRequest request) {
		BaseMsg msg = new BaseMsg();
		
		return msg;
	}

	/*
	 * @RequestMapping(value = "/project/info") public BaseMsg
	 * getFilmDestPath(@RequestBody final ProjectInfoView project,final
	 * HttpServletRequest request) { BaseMsg msg=new BaseMsg(); return msg; }
	 */

}
