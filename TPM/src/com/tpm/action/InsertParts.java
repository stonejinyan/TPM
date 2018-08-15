package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InsertParts extends ActionSupport {

	// 设备新增页面转发
	public String execute() throws Exception {
		ActionContext.getContext().put("active", "new");
		// ActionContext.getContext().put("staffList", staffService.getAllStaff());
		// ActionContext.getContext().put("processLine_AreaList",processLine_AreaDao.getAllProcessLine_Area());
		return "success";
	}
}
