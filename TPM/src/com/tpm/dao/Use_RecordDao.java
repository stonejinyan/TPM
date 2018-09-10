package com.tpm.dao;

import java.util.List;

import com.tpm.bean.UseRecord;

public class Use_RecordDao extends IBaseDao<UseRecord> {

	public static final String tableName = "use_record";

	public List<UseRecord> getUse_RecordDaoBymaintenance_idD(int maintenance_id) {
		return super.findByForeignId(maintenance_id, tableName, "maintenance_daily_work_record_id");
	}
}
