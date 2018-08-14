package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.Equipment;
import com.tpm.bean.EquipmentList;
import com.tpm.tool.JDBCUtils;

public class EquipmentDao {

	public List<EquipmentList> getAllEquipmentList() {
		// TODO Auto-generated method stub
		String sql = "select * from eplist";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<EquipmentList> list = queryRunner.query(sql, new BeanListHandler<EquipmentList>(EquipmentList.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Equipment> getAllEquipments() {
		// TODO Auto-generated method stub
		String sql = "select * from ep";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<Equipment> list = queryRunner.query(sql, new BeanListHandler<Equipment>(Equipment.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void insert(Equipment equipment) {
		String sql1 = "insert into ep values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		Object[] param1 = { equipment.getEpid(), equipment.getName(), equipment.getDescription(), equipment.getStatus(),
		        equipment.getCritical(), equipment.getEnvironmental_impact(), equipment.getOutput_impact(),
		        equipment.getEp_complexity(), equipment.getEp_manufacturing_channel(), equipment.getEp_cost(),
		        equipment.getEp_score(), equipment.getBackup_plan(), equipment.getCheck_method(),
		        equipment.getCheck_cycle(), equipment.getCheck_staff_id(), equipment.getMaintain_staff_id(),
		        equipment.getProperty_id(), equipment.getAttribute(), equipment.getSave_area_id(),
		        equipment.getType() };
		try {
			queryRunner.update(sql1, param1);
		} catch (SQLException e) {
			e.printStackTrace();

			throw new RuntimeException(e.getMessage());
		}
	}

	public List<Equipment> getAllEquipmentBySave_area_id(int save_area_id) {
		// TODO Auto-generated method stub
		String sql = "select * from ep where save_area_id = ?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<Equipment> list = queryRunner.query(sql, new BeanListHandler<Equipment>(Equipment.class),
			        save_area_id);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updateEPScore(Equipment equipment) {
		String sql1 = "update ep set ep_score = ? , critical = ? where id = ?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			queryRunner.update(sql1, equipment.getEp_score(), equipment.getCritical(), equipment.getId());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
}