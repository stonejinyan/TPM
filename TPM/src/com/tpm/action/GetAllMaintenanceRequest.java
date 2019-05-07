package com.tpm.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.MaintenanceRequestTableDao;

public class GetAllMaintenanceRequest extends ActionSupport {

	public String execute() throws Exception {
		MaintenanceRequestTableDao maintenanceRequestTableDao = new MaintenanceRequestTableDao();
		Gson gson = new Gson();
		ActionContext.getContext().put("Json", gson.toJson(maintenanceRequestTableDao.getAll()));
		return "success";

	}
}
