package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.MaintenanceType;
import com.tpm.tool.JDBCUtils;

public class MaintenanceTypeDao {

	public List<MaintenanceType> getAllMaintenanceType() {
		// TODO Auto-generated method stub
		String sql = "select * from maintenance_type";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<MaintenanceType> list = queryRunner.query(sql,
			        new BeanListHandler<MaintenanceType>(MaintenanceType.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
