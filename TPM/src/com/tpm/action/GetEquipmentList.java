package com.tpm.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;

public class GetEquipmentList extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();
	private int type;
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

	public String execute() throws Exception {
		ActionContext.getContext().put("Json", gson.toJson(equipmentDao.getAllEquipmentListByType(type)));
		return "success";

	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
