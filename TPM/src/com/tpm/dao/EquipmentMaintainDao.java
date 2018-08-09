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
	public void insert(MaintenanceDailyWorkRecord maintenanceDailyWorkRecord, List<UseRecord> useRecords,
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
			        + maintenanceDailyWorkRecord.getUser_time() + "','" + maintenanceDailyWorkRecord.getEp_id() + "')";
			ps = conn.prepareStatement(sql1);
			ps.executeUpdate();
			String sql2 = "SELECT LAST_INSERT_ID()";
			ps = conn.prepareStatement(sql2);
			ResultSet RS = ps.executeQuery();
			RS.next();
			// System.out.println(RS.getInt(1));
			for (int i = 0; i < useRecords.size(); i++) {
				UseRecord useRecord = useRecords.get(i);
				String sql3 = "insert into use_record values(null,'" + maintenanceDailyWorkRecord.getStaff_id() + "','"
				        + useRecord.getReplacement_part_id() + "','" + RS.getInt(1) + "','" + useRecord.getUse_number()
				        + "')";
				ps = conn.prepareStatement(sql3);
				ps.executeUpdate();
				String sql5 = "update replacement_part set number = number - '" + useRecord.getUse_number()
				        + "' where id = '" + useRecord.getReplacement_part_id() + "'";
				ps = conn.prepareStatement(sql5);
				ps.executeUpdate();
			}
			String sql4 = "update pm_schedule set finish = '完成'  where id = '" + pmSchedule_id + "'";
			ps = conn.prepareStatement(sql4);
			ps.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
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