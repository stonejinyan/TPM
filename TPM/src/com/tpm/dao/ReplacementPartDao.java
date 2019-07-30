package com.tpm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.PartUseRecordList;
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

	public List<ReplacementPart> getSparePartsRequestList() {
		// TODO Auto-generated method stub
		String sql = "select * from replacement_part where number <= order_number";
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

	public void insert(ReplacementPart replacementPart, int staffid) {
		String sql1 = "insert into replacement_part values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2 = "select * from replacement_part where part_id = ?";
		String sql3 = "insert into account_record(id,add_number,staff_id,replacement_part_id,total) VALUES(null,?,?,?,?)";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		Object[] param1 = { replacementPart.getPart_id(), replacementPart.getDomain(), replacementPart.getName(),
		        replacementPart.getSpecification(), replacementPart.getBrand(), replacementPart.getUserep(),
		        replacementPart.getDeliverycycle(), replacementPart.getPartvalue(), replacementPart.getEpcritical(),
		        replacementPart.getVicarism(), replacementPart.getVulnerability(), replacementPart.getPartscore(),
		        replacementPart.getCritical(), replacementPart.getBoxtype_id(), replacementPart.getMax(),
		        replacementPart.getOrder_number(), replacementPart.getMin(), replacementPart.getNumber(),
		        replacementPart.getUnit(), replacementPart.getPrice() };
		try {
			queryRunner.update(sql1, param1);
			ReplacementPart newpart = queryRunner.query(sql2, new BeanHandler<ReplacementPart>(ReplacementPart.class),
			        replacementPart.getPart_id());
			queryRunner.update(sql3, replacementPart.getNumber(), staffid, newpart.getId(), newpart.getNumber());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

	public void update(ReplacementPart replacementPart, int staffid) {
		String sql1 = "update replacement_part set number = number + ? where part_id = ?";
		String sql2 = "select * from replacement_part where part_id = ?";
		String sql3 = "insert into account_record(id,add_number,staff_id,replacement_part_id,total) VALUES(null,?,?,?,?)";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			queryRunner.update(sql1, replacementPart.getNumber(), replacementPart.getPart_id());
			ReplacementPart newpart = queryRunner.query(sql2, new BeanHandler<ReplacementPart>(ReplacementPart.class),
			        replacementPart.getPart_id());
			queryRunner.update(sql3, replacementPart.getNumber(), staffid, newpart.getId(), newpart.getNumber());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

	public void updateCritical(ReplacementPart replacementPart) {
		// TODO Auto-generated method stub
		String sql1 = "update replacement_part set partscore = ? , critical = ? where id = ?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			queryRunner.update(sql1, replacementPart.getPartscore(), replacementPart.getCritical(),
			        replacementPart.getId());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

	public List<PartUseRecordList> getPartUseRecordList() {
		// TODO Auto-generated method stub
		String sql = "select * from part_user_record";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<PartUseRecordList> list = queryRunner.query(sql,
			        new BeanListHandler<PartUseRecordList>(PartUseRecordList.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

//	public List<Equipment> getAllEquipmentBySave_area_id(int save_area_id) { //
//	  TODO Auto-generated method stub String sql = "select * from ep where
//	  save_area_id = ?"; QueryRunner queryRunner = new
//	  QueryRunner(JDBCUtils.getDataSource()); try { List<Equipment> list =
//	  queryRunner.query(sql, new BeanListHandler<Equipment>(Equipment.class),
//	 save_area_id); return list; } catch (SQLException e) { e.printStackTrace(); }
//	  return null; }

}
