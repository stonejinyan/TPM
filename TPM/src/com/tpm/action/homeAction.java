package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class homeAction extends ActionSupport {
	private String name;

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "home");
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
