package com.tpm.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.ReplacementPartDao;

public class GetReplacementParts extends ActionSupport {

	public String execute() throws Exception {
		ReplacementPartDao replacementPartDao = new ReplacementPartDao();
		Gson gson = new Gson();
		ActionContext.getContext().put("Json", gson.toJson(replacementPartDao.getAllReplacementParts()));
		return "success";

	}

}
