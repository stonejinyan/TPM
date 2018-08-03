package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.Equipment;
import com.tpm.dao.EquipmentDao;

public class InsertEquipment extends ActionSupport {

	private Equipment equipment = new Equipment();
	EquipmentDao equipmentDao = new EquipmentDao();

	public String execute() throws Exception {
		equipmentDao.insert(equipment);
		ActionContext.getContext().getSession().put("error", "");
		return "success";

	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}
}
