package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IncreaseParts extends ActionSupport {

	// 转设备新增页面
	public String execute() throws Exception {
		ActionContext.getContext().put("active", "new");
		// ActionContext.getContext().put("staffList", staffService.getAllStaff());
		// ActionContext.getContext().put("processLine_AreaList",processLine_AreaDao.getAllProcessLine_Area());
		return "success";
	}
}
