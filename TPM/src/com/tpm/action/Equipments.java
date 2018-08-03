package com.tpm.action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;
import com.tpm.dao.ProcessLine_AreaDao;

public class Equipments extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();

	public String execute() throws Exception {
		ProcessLine_AreaDao processLine_AreaDao = new ProcessLine_AreaDao();
		Gson gson = new Gson();
		ActionContext.getContext().put("Json", gson.toJson(processLine_AreaDao.getAllProcessLine_Area()));
		return "success";

	}

}
