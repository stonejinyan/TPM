package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.PMSchedule;
import com.tpm.tool.JDBCUtils;

public class PMScheduleDao {

	public List<PMSchedule> getAllPMSchedule() {
		// TODO Auto-generated method stub
		String sql = "select * from pm_schedule";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<PMSchedule> list = queryRunner.query(sql, new BeanListHandler<PMSchedule>(PMSchedule.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<PMSchedule> getAllPMSchedule(int ep_id) {
		// TODO Auto-generated method stub
		String sql = "select * from pm_schedule where ep_id = ?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<PMSchedule> list = queryRunner.query(sql, new BeanListHandler<PMSchedule>(PMSchedule.class), ep_id);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
