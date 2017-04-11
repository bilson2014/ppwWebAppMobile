package com.panfeng.web.wearable.resource.view;

public class IndentView extends Pagination{

	private static final long serialVersionUID = -6378756993311609394L;

	private Long serviceId = null; // 关联服务
	
	private Long userId = null; // 关联用户
	
	private String indentNum = null; // 订单编号
	
	private Integer indentType = null; // 订单状态

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getIndentNum() {
		return indentNum;
	}

	public void setIndentNum(String indentNum) {
		this.indentNum = indentNum;
	}

	public Integer getIndentType() {
		return indentType;
	}

	public void setIndentType(Integer indentType) {
		this.indentType = indentType;
	}
	
}
