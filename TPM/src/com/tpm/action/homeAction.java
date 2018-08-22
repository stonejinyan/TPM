package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.PMScheduleDao;

public class homeAction extends ActionSupport {
	private String name;
	PMScheduleDao pmScheduleDao = new PMScheduleDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "home");
		ActionContext.getContext().put("Week_Pm_Schedule", pmScheduleDao.getAllWeek_Pm_Schedule());
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
