package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.ReplacementPartDao;

public class PartList extends ActionSupport {

	ReplacementPartDao replacementPartDao = new ReplacementPartDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "record");
		ActionContext.getContext().put("Parts", replacementPartDao.getAllReplacementParts());
		// ActionContext.getContext().put("processLine_AreaList",processLine_AreaDao.getAllProcessLine_Area());
		return "success";
	}
}
