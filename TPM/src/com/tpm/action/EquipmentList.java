package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;

public class EquipmentList extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("equipmentlist", equipmentDao.getAllEquipment());
		ActionContext.getContext().put("active", "EquipmentList");
		return "success";

	}

}
