package com.tpm.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.MaintenanceTypeDao;

public class MaintenanceType extends ActionSupport {

	MaintenanceTypeDao maintenanceTypeDao = new MaintenanceTypeDao();

	public String execute() throws Exception {
		Gson gson = new Gson();
		ActionContext.getContext().put("Json", gson.toJson(maintenanceTypeDao.getAllMaintenanceType()));
		return "success";
	}
}
