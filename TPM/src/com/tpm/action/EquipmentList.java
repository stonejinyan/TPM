package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;

public class EquipmentList extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();
	private int type;

	public String execute() throws Exception {
		ActionContext.getContext().put("equipmentlist", equipmentDao.getAllEquipmentListByType(type));
		ActionContext.getContext().put("active", "record");
		if (type == 5) {
			return "toollist";
		}
		return "success";

	}

	public EquipmentDao getEquipmentDao() {
		return equipmentDao;
	}

	public void setEquipmentDao(EquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
