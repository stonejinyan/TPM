package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.ReplacementPart;
import com.tpm.tool.JDBCUtils;

public class ReplacementPartDao {

	public List<ReplacementPart> getAllReplacementParts() {
		// TODO Auto-generated method stub
		String sql = "select * from replacement_part";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<ReplacementPart> list = queryRunner.query(sql,
			        new BeanListHandler<ReplacementPart>(ReplacementPart.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	/***
	 * public void insert(Equipment equipment) { String sql1 = "insert into ep
	 * values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; QueryRunner queryRunner
	 * = new QueryRunner(JDBCUtils.getDataSource()); Object[] param1 = {
	 * equipment.getEpid(), equipment.getName(), equipment.getDescription(),
	 * equipment.getStatus(), equipment.getCritical(),
	 * equipment.getEnvironmental_impact(), equipment.getOutput_impact(),
	 * equipment.getEp_complexity(), equipment.getEp_manufacturing_channel(),
	 * equipment.getEp_cost(), equipment.getEp_score(), equipment.getBackup_plan(),
	 * equipment.getCheck_method(), equipment.getCheck_cycle(),
	 * equipment.getCheck_staff_id(), equipment.getMaintain_staff_id(),
	 * equipment.getProperty_id(), equipment.getAttribute(),
	 * equipment.getSave_area_id() }; try { queryRunner.update(sql1, param1); }
	 * catch (SQLException e) { e.printStackTrace();
	 * 
	 * throw new RuntimeException(e.getMessage()); } }
	 * 
	 * public List<Equipment> getAllEquipmentBySave_area_id(int save_area_id) { //
	 * TODO Auto-generated method stub String sql = "select * from ep where
	 * save_area_id = ?"; QueryRunner queryRunner = new
	 * QueryRunner(JDBCUtils.getDataSource()); try { List<Equipment> list =
	 * queryRunner.query(sql, new BeanListHandler<Equipment>(Equipment.class),
	 * save_area_id); return list; } catch (SQLException e) { e.printStackTrace(); }
	 * return null; }
	 **/
}
