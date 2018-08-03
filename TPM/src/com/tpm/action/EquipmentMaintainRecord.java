package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.MaintenanceDailyWorkRecordListDao;

public class EquipmentMaintainRecord extends ActionSupport {

	MaintenanceDailyWorkRecordListDao maintenanceDailyWorkRecordList = new MaintenanceDailyWorkRecordListDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("equipmentMaintainRecord",
		        maintenanceDailyWorkRecordList.getAllMaintenanceDailyWorkRecords());
		ActionContext.getContext().put("active", "equipmentmaintainRecord");
		return "success";

	}
}
