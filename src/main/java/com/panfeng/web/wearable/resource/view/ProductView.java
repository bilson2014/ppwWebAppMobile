package com.panfeng.web.wearable.resource.view;

public class ProductView extends Pagination{

	private static final long serialVersionUID = 4923161689285696056L;

	private Long teamId = null; // 所属团队
	
	private Long productId = null; // 产品编号
	
	private String productName = null; // 产品名称
	
	private String order = null; // 排序规则
	
	private String productType = null; // 项目类别
	
	private String uploadDate = null; // 上传时间
	
	private Integer recommend = null; // 推荐值
	
	private Long supportCount = null; // 点赞
	
	private String videoLength = null; // 视频长度
	
	private double priceBegin = 0d; // 起始价格
	
	private double priceEnd = 0d; // 结束价格
	
	private long lengthBegin = 0l; // 起始时长
	
	private long lengthEnd = 0l; // 结束时长
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Long getTeamId() {
		return teamId;
	}

	public void setTeamId(Long teamId) {
		this.teamId = teamId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

	public Long getSupportCount() {
		return supportCount;
	}

	public void setSupportCount(Long supportCount) {
		this.supportCount = supportCount;
	}

	public String getVideoLength() {
		return videoLength;
	}

	public void setVideoLength(String videoLength) {
		this.videoLength = videoLength;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPriceBegin() {
		return priceBegin;
	}

	public void setPriceBegin(double priceBegin) {
		this.priceBegin = priceBegin;
	}

	public double getPriceEnd() {
		return priceEnd;
	}

	public void setPriceEnd(double priceEnd) {
		this.priceEnd = priceEnd;
	}

	public long getLengthBegin() {
		return lengthBegin;
	}

	public void setLengthBegin(long lengthBegin) {
		this.lengthBegin = lengthBegin;
	}

	public long getLengthEnd() {
		return lengthEnd;
	}

	public void setLengthEnd(long lengthEnd) {
		this.lengthEnd = lengthEnd;
	}

}
