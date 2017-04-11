package com.panfeng.web.wearable.resource.model;

import com.panfeng.web.wearable.domain.BaseObject;

public class Solr extends BaseObject{

	private static final long serialVersionUID = -3365175562854271223L;

	private String productId = null; // 视频ID
	
	private String productName = null; // 视频名称
	
	private String pDescription = null; // 视频描述
	
	private String picLDUrl = null; // 海报
	
	private float orignalPrice = 0f; // 原价
	
	private float price = 0f; // 打折之后的价格
	
	private long length = 0l; // 长度
	
	private String teamId = null; // 团队ID
	
	private String teamName = null; // 团队名称
	
	private String itemId = null; // 类型ID
	
	private String itemName = null; // 类型名称
	
	private String tags = null; // 标签
	
	private String condition = null; // 搜索条件
	
	private long total = 0l; // 总数
	
	private Integer recommend;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getPicLDUrl() {
		return picLDUrl;
	}

	public void setPicLDUrl(String picLDUrl) {
		this.picLDUrl = picLDUrl;
	}

	public float getOrignalPrice() {
		return orignalPrice;
	}

	public void setOrignalPrice(float orignalPrice) {
		this.orignalPrice = orignalPrice;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public long getLength() {
		return length;
	}

	public void setLength(long length) {
		this.length = length;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	
}
