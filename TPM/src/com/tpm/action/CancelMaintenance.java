package com.tpm.action;

import java.util.List;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.UseRecord;
import com.tpm.dao.EquipmentMaintainDao;
import com.tpm.dao.Use_RecordDao;

public class CancelMaintenance extends ActionSupport {

	private int maintenance_id;
	EquipmentMaintainDao equipmentMaintainDao = new EquipmentMaintainDao();
	Use_RecordDao use_RecordDao = new Use_RecordDao();

	public String execute() throws Exception {
		List<UseRecord> use_Records = use_RecordDao.getUse_RecordDaoBymaintenance_idD(maintenance_id);
		Gson gson = new Gson();
		ActionContext.getContext().put("Json",
		        gson.toJson(equipmentMaintainDao.cancalMaintenance(use_Records, maintenance_id)));
		return "success";

	}

	public int getMaintenance_id() {
		return maintenance_id;
	}

	public void setMaintenance_id(int maintenance_id) {
		this.maintenance_id = maintenance_id;
	}

}
