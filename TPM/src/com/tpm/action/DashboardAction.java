package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DashboardAction extends ActionSupport {
	private String name;

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "dashboard");
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
