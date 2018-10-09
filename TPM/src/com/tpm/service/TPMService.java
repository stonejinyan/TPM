package com.tpm.service;

import com.tpm.dao.EquipmentDao;
import com.tpm.dao.MaintenanceDailyWorkRecordListDao;

public class TPMService {

	MaintenanceDailyWorkRecordListDao maintenanceDailyWorkRecordListDao = new MaintenanceDailyWorkRecordListDao();
	EquipmentDao equipmentDao = new EquipmentDao();

	public double getMTTR(String starttime, String endtime) {
		// TODO Auto-generated method stub
		double MTTR = maintenanceDailyWorkRecordListDao.getMaintenanceTime(starttime, endtime)
		        / maintenanceDailyWorkRecordListDao.getMaintenanceCount(starttime, endtime);
		return MTTR;
	}

	public double getMTBF(String starttime, String endtime) {
		// TODO Auto-generated method stub
		double MTBF = (equipmentDao.getEPCount(1) * 7.5 * 30
		        - maintenanceDailyWorkRecordListDao.getMaintenanceTime(starttime, endtime) / 60)
		        / maintenanceDailyWorkRecordListDao.getMaintenanceCount(starttime, endtime);
		return MTBF;
	}
}
