package com.tpm.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EPFilesTableDao;

public class GetEquipmentFileListAction extends ActionSupport {

	EPFilesTableDao epFilesTableDao = new EPFilesTableDao();
	private int id;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

	public String execute() throws Exception {
		ActionContext.getContext().put("Json", gson.toJson(epFilesTableDao.getByEPID(id)));
		return "success";

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
