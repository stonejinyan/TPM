package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.MaintenanceDailyWorkRecordList;
import com.tpm.tool.JDBCUtils;

public class MaintenanceDailyWorkRecordListDao {

	public List<MaintenanceDailyWorkRecordList> getAllMaintenanceDailyWorkRecords() {
		// TODO Auto-generated method stub
		String sql = "select * from equipmentmaintainrecord order by id desc";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<MaintenanceDailyWorkRecordList> list = queryRunner.query(sql,
			        new BeanListHandler<MaintenanceDailyWorkRecordList>(MaintenanceDailyWorkRecordList.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
