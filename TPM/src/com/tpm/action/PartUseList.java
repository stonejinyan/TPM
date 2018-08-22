package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.ReplacementPartDao;

public class PartUseList extends ActionSupport {

	ReplacementPartDao replacementPartDao = new ReplacementPartDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("partuserlist", replacementPartDao.getPartUseRecordList());
		ActionContext.getContext().put("active", "record");
		return "success";
	}

}
