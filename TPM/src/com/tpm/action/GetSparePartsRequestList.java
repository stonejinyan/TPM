package com.tpm.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.ReplacementPartDao;

public class GetSparePartsRequestList extends ActionSupport {

	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	ReplacementPartDao replacementPartDao = new ReplacementPartDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("Json", gson.toJson(replacementPartDao.getSparePartsRequestList()));
		return "success";
	}

}
