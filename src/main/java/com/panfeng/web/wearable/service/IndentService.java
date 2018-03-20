package com.panfeng.web.wearable.service;

import javax.servlet.http.HttpSession;

import com.paipianwang.pat.facade.indent.entity.PmsIndent;
import com.panfeng.web.wearable.domain.Result;

public interface IndentService {

	public Result saveIndent(PmsIndent indent,HttpSession session);
	
	public void editSalesmanIndent(PmsIndent indent);
}
