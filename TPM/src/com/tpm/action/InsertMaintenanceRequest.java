package com.tpm.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.MaintenanceRequest;
import com.tpm.bean.Staff;
import com.tpm.dao.MaintenanceRequestDao;

public class InsertMaintenanceRequest extends ActionSupport {

	private MaintenanceRequest maintenanceRequest = new MaintenanceRequest();
	MaintenanceRequestDao maintenanceRequestDao = new MaintenanceRequestDao();

	public String execute() throws Exception {
		if (maintenanceRequest.getTime() == null) {
			maintenanceRequest.setTime(new java.sql.Date(new Date().getTime()));
		}
		maintenanceRequest.setStaff_id(((Staff) ActionContext.getContext().getSession().get("staff")).getId());
		maintenanceRequestDao.save(maintenanceRequest);
		return "success";

	}

	public MaintenanceRequest getMaintenanceRequest() {
		return maintenanceRequest;
	}

	public void setMaintenanceRequest(MaintenanceRequest maintenanceRequest) {
		this.maintenanceRequest = maintenanceRequest;
	}

}
