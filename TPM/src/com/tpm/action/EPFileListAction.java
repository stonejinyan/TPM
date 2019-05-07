package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;

public class EPFileListAction extends ActionSupport {

	private int id;
	EquipmentDao equipmentDao = new EquipmentDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "record");
		if (id != 0) {
			ActionContext.getContext().getSession().put("ep", equipmentDao.getByID(id));
			ActionContext.getContext().getSession().put("getFilesByep_id", id);
		}
		return "success";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
