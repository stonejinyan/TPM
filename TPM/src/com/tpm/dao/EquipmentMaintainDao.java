package com.tpm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.MaintenanceDailyWorkRecord;
import com.tpm.bean.UseRecord;
import com.tpm.bean.Ｍaintenance_time;
import com.tpm.tool.JDBCUtils;

public class EquipmentMaintainDao {

	public List<MaintenanceDailyWorkRecord> getAllMaintenanceDailyWorkRecords() {
		// TODO Auto-generated method stub
		String sql = "select * from maintenance_daily_work_record";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<MaintenanceDailyWorkRecord> list = queryRunner.query(sql,
			        new BeanListHandler<MaintenanceDailyWorkRecord>(MaintenanceDailyWorkRecord.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("resource")
	public String insert(MaintenanceDailyWorkRecord maintenanceDailyWorkRecord, List<UseRecord> useRecords,
	        int pmSchedule_id) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			// 设置提交方式为非自动提交
			// 一旦autocommit为false
			// 你必须调用conn.commit()才会提交
			conn.setAutoCommit(false);
			// 设置事务的隔离级别
			// 不要写数字，要引用类的常量
			// 1.可读性强
			// 2，API有一日升级了，4代表别的意思了，但是TRANSACTION_REPEATABLE_READ它代表的意思永远不会改变
			// 即使这句话不写也是默认值为TRANSACTION_REPEATABLE_READ 因为连接的是mysql数据库
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			// 1左移32位然后减1
			// System.out.println((1<<32)-1);
			// int类型的最大值
			// System.out.println(Integer.MAX_VALUE);
			String sql1 = "insert into maintenance_daily_work_record values(null,'"
			        + maintenanceDailyWorkRecord.getQuestion_description() + "','"
			        + maintenanceDailyWorkRecord.getProcess_description() + "','" + maintenanceDailyWorkRecord.getType()
			        + "','" + maintenanceDailyWorkRecord.getPm_id() + "','" + maintenanceDailyWorkRecord.getTime()
			        + "','" + maintenanceDailyWorkRecord.getStaff_id() + "','"
			        + maintenanceDailyWorkRecord.getUser_time() + "','" + maintenanceDailyWorkRecord.getEp_id()
			        + "','1')";
			ps = conn.prepareStatement(sql1);
			ps.executeUpdate();
			String sql2 = "SELECT LAST_INSERT_ID()";
			ps = conn.prepareStatement(sql2);
			ResultSet RS = ps.executeQuery();
			RS.next();
			// System.out.println(RS.getInt(1));
			for (int i = 0; i < useRecords.size(); i++) {
				UseRecord useRecord = useRecords.get(i);
				if (useRecord.getReplacement_part_id() != 0) {
					String sql3 = "insert into use_record values(null,'" + maintenanceDailyWorkRecord.getStaff_id()
					        + "','" + useRecord.getReplacement_part_id() + "','" + RS.getInt(1) + "','"
					        + useRecord.getUse_number() + "','1')";
					ps = conn.prepareStatement(sql3);
					ps.executeUpdate();
					String sql5 = "update replacement_part set number = number - '" + useRecord.getUse_number()
					        + "' where id = '" + useRecord.getReplacement_part_id() + "'";
					ps = conn.prepareStatement(sql5);
					ps.executeUpdate();
				}
			}
			String sql4 = "update pm_schedule set finish = '完成' , maintenance_id = '" + RS.getInt(1) + "'"
			        + " where id = '" + pmSchedule_id + "'";
			ps = conn.prepareStatement(sql4);
			ps.executeUpdate();
			conn.commit();
			return "success";
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
			return "error";
		} finally {
			if (conn != null) {
				conn.setAutoCommit(true);
				conn.close();
			}
			if (conn != null) {
				ps.close();
			}
		}
	}

	public List<Ｍaintenance_time> getMaintenanceTime() {
		// TODO Auto-generated method stub
		String sql = "SELECT sum( user_time ) DATA,NAME FROM maintenance_daily_work_record,maintenance_type WHERE status_id = 1 and type = maintenance_type.id GROUP BY type";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<Ｍaintenance_time> list = queryRunner.query(sql,
			        new BeanListHandler<Ｍaintenance_time>(Ｍaintenance_time.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String cancalMaintenance(List<UseRecord> use_Records, int maintenance_id) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtils.getConnection();
			// 设置提交方式为非自动提交
			// 一旦autocommit为false
			// 你必须调用conn.commit()才会提交
			conn.setAutoCommit(false);
			// 设置事务的隔离级别
			// 不要写数字，要引用类的常量
			// 1.可读性强
			// 2，API有一日升级了，4代表别的意思了，但是TRANSACTION_REPEATABLE_READ它代表的意思永远不会改变
			// 即使这句话不写也是默认值为TRANSACTION_REPEATABLE_READ 因为连接的是mysql数据库
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			String sql = "SELECT status_id from maintenance_daily_work_record where id = '" + maintenance_id + "'";
			ps = conn.prepareStatement(sql);
			ResultSet RS = ps.executeQuery();
			RS.next();
			if (RS.getInt(1) != 1) {
				throw new Exception("重复撤销");
			}
			String sql1 = "update maintenance_daily_work_record set status_id = '2' where id = '" + maintenance_id
			        + "'";
			ps = conn.prepareStatement(sql1);
			ps.executeUpdate();
			String sql2 = "update pm_schedule set finish = null where maintenance_id = '" + maintenance_id + "'";
			ps = conn.prepareStatement(sql2);
			ps.executeUpdate();
			for (int i = 0; i < use_Records.size(); i++) {
				UseRecord useRecord = use_Records.get(i);
				if (useRecord.getReplacement_part_id() != 0) {
					String sql3 = "update use_record set status_id = '2' where maintenance_daily_work_record_id = '"
					        + maintenance_id + "'";
					ps = conn.prepareStatement(sql3);
					ps.executeUpdate();
					String sql4 = "update replacement_part set number = number + '" + useRecord.getUse_number()
					        + "' where id = '" + useRecord.getReplacement_part_id() + "'";
					ps = conn.prepareStatement(sql4);
					ps.executeUpdate();
				}
			}
			conn.commit();
			return "success";
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
			return "error" + e.getMessage();
		} finally {
			if (conn != null) {
				conn.setAutoCommit(true);
				conn.close();
			}
			if (conn != null) {
				ps.close();
			}
		}

	}
}