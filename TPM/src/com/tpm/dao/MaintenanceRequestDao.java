package com.tpm.dao;

import com.tpm.bean.MaintenanceRequest;

public class MaintenanceRequestDao extends IBaseDao<MaintenanceRequest> {

	public static final String tableName = "maintenancerequest";

	public boolean save(MaintenanceRequest maintenanceRequest) {
		return super.save(maintenanceRequest, tableName);
	}
}