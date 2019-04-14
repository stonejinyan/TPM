package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.MaintenanceDailyWorkRecordList;
import com.tpm.bean.ServerPagination;
import com.tpm.tool.JDBCUtils;

public class MaintenanceDailyWorkRecordListDao extends IBaseDao<MaintenanceDailyWorkRecordList> {

	public static final String tableName = "equipmentmaintainrecord";

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

	public double getMaintenanceTime(String starttime, String endtime) {
		String sql = "SELECT SUM( m.user_time ) FROM maintenance_daily_work_record AS m,ep WHERE m.type = 2 AND m.ep_id = ep.id AND ep.type = 1 AND m.time >= ? AND m.time <= ?";
		return super.queryForSum(sql, starttime, endtime);
	}

	public long getMaintenanceCount(String starttime, String endtime) {
		String sql = "SELECT COUNT( m.user_time ) FROM maintenance_daily_work_record AS m,ep WHERE m.type = 2 AND m.ep_id = ep.id AND ep.type = 1 AND m.time >= ? AND m.time <= ?";
		return super.queryForCount(sql, starttime, endtime);
	}

	public ServerPagination getAll(int offset, int limit, String order) {
		// TODO Auto-generated method stub
		ServerPagination serverPagination = new ServerPagination();
		serverPagination.setRow(super.getAll(tableName, offset, limit, order));
		serverPagination.setTotal(super.queryForTotal(tableName));
		return serverPagination;
	}

}
