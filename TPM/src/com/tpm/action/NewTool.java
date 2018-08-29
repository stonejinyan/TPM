package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.ProcessLine_AreaDao;
import com.tpm.service.StaffService;

public class NewTool extends ActionSupport {
	private String name;
	StaffService staffService = new StaffService();
	ProcessLine_AreaDao processLine_AreaDao = new ProcessLine_AreaDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "new");
		ActionContext.getContext().put("staffList", staffService.getAllStaff());
		ActionContext.getContext().put("processLine_AreaList", processLine_AreaDao.getAllProcessLine_Area());
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
