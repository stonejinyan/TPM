package com.tpm.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;

public class GetEquipmentbyArea extends ActionSupport {

	private int save_area_id;

	public String execute() throws Exception {
		EquipmentDao equipmentDao = new EquipmentDao();
		Gson gson = new Gson();
		ActionContext.getContext().put("Json", gson.toJson(equipmentDao.getAllEquipmentBySave_area_id(save_area_id)));
		return "success";

	}

	public int getSave_area_id() {
		return save_area_id;
	}

	public void setSave_area_id(int save_area_id) {
		this.save_area_id = save_area_id;
	}

}
