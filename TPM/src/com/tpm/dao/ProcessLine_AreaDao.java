package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.ProcessLine_Area;
import com.tpm.tool.JDBCUtils;

public class ProcessLine_AreaDao {

	public List<ProcessLine_Area> getAllProcessLine_Area() {
		// TODO Auto-generated method stub
		String sql = "select * from processline_area";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<ProcessLine_Area> list = queryRunner.query(sql,
			        new BeanListHandler<ProcessLine_Area>(ProcessLine_Area.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
