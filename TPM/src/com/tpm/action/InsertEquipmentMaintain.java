package com.tpm.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.MaintenanceDailyWorkRecord;
import com.tpm.bean.Staff;
import com.tpm.bean.UseRecord;
import com.tpm.dao.EquipmentMaintainDao;
import com.tpm.tool.LogUtil;

public class InsertEquipmentMaintain extends ActionSupport {

	private MaintenanceDailyWorkRecord maintenanceDailyWorkRecord = new MaintenanceDailyWorkRecord();
	private List<UseRecord> useRecords = new ArrayList<UseRecord>();
	private int area;
	private int partkind;
	EquipmentMaintainDao equipmentMaintainDao = new EquipmentMaintainDao();
	private int pmSchedule_id;

	public String execute() throws Exception {
		System.out.println("插入设备维修记录：" + maintenanceDailyWorkRecord.getTime());
		if (maintenanceDailyWorkRecord.getTime() == null) {
			maintenanceDailyWorkRecord.setTime(new java.sql.Date(new Date().getTime()));
		}
		if (maintenanceDailyWorkRecord.getEp_id() != 0) {
			if (maintenanceDailyWorkRecord.getType() == 1) {
				maintenanceDailyWorkRecord.setPm_id(pmSchedule_id);
			} else if (maintenanceDailyWorkRecord.getType() == 2) {
				maintenanceDailyWorkRecord.setRm_id(pmSchedule_id);
			}
			maintenanceDailyWorkRecord
			        .setStaff_id(((Staff) ActionContext.getContext().getSession().get("staff")).getId());
			equipmentMaintainDao.insert(maintenanceDailyWorkRecord, useRecords, pmSchedule_id);
		}
		LogUtil.RollingFile.info(((Staff) ActionContext.getContext().getSession().get("staff")).getName() + "插入一条维修记录"
		        + maintenanceDailyWorkRecord + "使用如下备品" + useRecords);
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

	public int getPmSchedule_id() {
		return pmSchedule_id;
	}

	public void setPmSchedule_id(int pmSchedule_id) {
		this.pmSchedule_id = pmSchedule_id;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getPartkind() {
		return partkind;
	}

	public void setPartkind(int partkind) {
		this.partkind = partkind;
	}

}
