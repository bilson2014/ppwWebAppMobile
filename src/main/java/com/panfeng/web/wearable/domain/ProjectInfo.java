package com.panfeng.web.wearable.domain;

import java.io.Serializable;

/**
 * 项目信息
 * @author rui
 *
 */
public class ProjectInfo implements Serializable{
	private static final long serialVersionUID = -884712437492516721L;

	/** 项目流程唯一编号 **/
	private String projectId;
	
	/** 项目名称 **/
	private String projectName;
	
	/** 产品线唯一编号 **/
	private Integer productId;

	/** 产品线名称 **/
//	private String productName;
	
	/** 交付日期：排期表最后一天 -- 维护进项目中（开始时间、交付时间、时长） **/
	private String deliveryDate;
	
	/** 项目报价 报价单价格 **/
	private String quotation;
	
	/** 项目阶段 **/
	private Integer projectStage;
	
	/** 是否有制片 **/
	private Integer hasProduction;
	
	/** 对标影片网址 **/
	private String filmDestPath;
	
	/** 是否有分镜脚本 **/
	private Integer hasContinuity;

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getQuotation() {
		return quotation;
	}

	public void setQuotation(String quotation) {
		this.quotation = quotation;
	}

	public Integer getProjectStage() {
		return projectStage;
	}

	public void setProjectStage(Integer projectStage) {
		this.projectStage = projectStage;
	}

	public Integer getHasProduction() {
		return hasProduction;
	}

	public void setHasProduction(Integer hasProduction) {
		this.hasProduction = hasProduction;
	}

	public String getFilmDestPath() {
		return filmDestPath;
	}

	public void setFilmDestPath(String filmDestPath) {
		this.filmDestPath = filmDestPath;
	}

	public Integer getHasContinuity() {
		return hasContinuity;
	}

	public void setHasContinuity(Integer hasContinuity) {
		this.hasContinuity = hasContinuity;
	}
	
	
	/** 是否有排期 **//*
	private Integer hasSchedule;
	
	*//** 是否有报价 **//*
	private Integer hasQuotation;*/
	
	
/*	
	*//** 是否有对标影片 **//*
	private Integer hasFilmDes;*/
	
}
