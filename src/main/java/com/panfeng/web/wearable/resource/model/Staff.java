package com.panfeng.web.wearable.resource.model;

import com.panfeng.web.wearable.domain.BaseObject;

public class Staff extends BaseObject {


	private static final long serialVersionUID = 9035018089576941292L;

	private long staffId = 0l;
	
	private String staffName = null;
	
	private String staffPosition = null;
	
	private String staffEducation = null;
	
	private String staffDescription = null;
	
	private String staffImageUrl = null;
	
	private String updateDate = null;
	
	private int od = 0; // 排序 
	
	public long getStaffId() {
		return staffId;
	}

	public void setStaffId(long staffId) {
		this.staffId = staffId;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffPosition() {
		return staffPosition;
	}

	public void setStaffPosition(String staffPosition) {
		this.staffPosition = staffPosition;
	}

	public String getStaffEducation() {
		return staffEducation;
	}

	public void setStaffEducation(String staffEducation) {
		this.staffEducation = staffEducation;
	}

	public String getStaffDescription() {
		return staffDescription;
	}

	public void setStaffDescription(String staffDescription) {
		this.staffDescription = staffDescription;
	}

	public String getStaffImageUrl() {
		return staffImageUrl;
	}

	public void setStaffImageUrl(String staffImageUrl) {
		this.staffImageUrl = staffImageUrl;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getOd() {
		return od;
	}

	public void setOd(int od) {
		this.od = od;
	}

}