package com.panfeng.web.wearable.resource.model;

import com.paipianwang.pat.facade.right.entity.PmsEmployee;

/**
 * 职工表
 * 
 * @author GY
 *
 */
public class Employee extends PmsEmployee {

	private static final long serialVersionUID = -2956477405160485997L;

	private String verification_code = null; // 验证码

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

}
