package com.tpm.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.MaintenanceDailyWorkRecord;
import com.tpm.bean.Staff;
import com.tpm.bean.UseRecord;
import com.tpm.dao.EquipmentMaintainDao;

public class InsertEquipmentMaintain extends ActionSupport {

	private MaintenanceDailyWorkRecord maintenanceDailyWorkRecord = new MaintenanceDailyWorkRecord();
	private List<UseRecord> useRecords = new ArrayList<UseRecord>();
	EquipmentMaintainDao equipmentMaintainDao = new EquipmentMaintainDao();

	public String execute() throws Exception {
		if (maintenanceDailyWorkRecord.getEp_id() != 0) {
			maintenanceDailyWorkRecord
			        .setStaff_id(((Staff) ActionContext.getContext().getSession().get("staff")).getId());
			equipmentMaintainDao.insert(maintenanceDailyWorkRecord, useRecords);
		}
		// ActionContext.getContext().put("active", "equipmentmaintainRecord");
		return "success";

	}

	public MaintenanceDailyWorkRecord getMaintenanceDailyWorkRecord() {
		return maintenanceDailyWorkRecord;
	}

	public void setMaintenanceDailyWorkRecord(MaintenanceDailyWorkRecord maintenanceDailyWorkRecord) {
		this.maintenanceDailyWorkRecord = maintenanceDailyWorkRecord;
	}

	public List<UseRecord> getUseRecords() {
		return useRecords;
	}

	public void setUseRecords(List<UseRecord> useRecords) {
		this.useRecords = useRecords;
	}

}
