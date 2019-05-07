package com.tpm.dao;

import java.util.List;

import com.tpm.bean.MaintenanceRequestTable;

public class MaintenanceRequestTableDao extends IBaseDao<MaintenanceRequestTable> {

	public static final String tableName = "maintenancerequesttable";

	public List<MaintenanceRequestTable> getAll() {
		return super.getAll(tableName);
	}

	public List<MaintenanceRequestTable> getAllByEPID(int ep_id) {
		String sql = "select * from " + tableName + " where ep_id = ?";
		return super.queryForMultiple(sql, ep_id);
	}
}