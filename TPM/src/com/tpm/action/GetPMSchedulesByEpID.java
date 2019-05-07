package com.tpm.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.MaintenanceRequestTableDao;

public class GetPMSchedulesByEpID extends ActionSupport {

	private int ep_id;

	public String execute() throws Exception {
		MaintenanceRequestTableDao maintenanceRequestTableDao = new MaintenanceRequestTableDao();
		Gson gson = new Gson();
		ActionContext.getContext().put("Json", gson.toJson(maintenanceRequestTableDao.getAllByEPID(ep_id)));
		return "success";

	}

	public int getEp_id() {
		return ep_id;
	}

	public void setEp_id(int ep_id) {
		this.ep_id = ep_id;
	}

}
