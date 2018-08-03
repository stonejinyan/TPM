package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.tpm.dao.ProcessLine_AreaDao;

public class EquipmentMaintain {

	ProcessLine_AreaDao processLine_AreaDao = new ProcessLine_AreaDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "EquipmentMaintain");
		ActionContext.getContext().put("processLine_AreaList", processLine_AreaDao.getAllProcessLine_Area());
		return "success";
	}
}
