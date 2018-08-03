package com.tpm.dao;

/*------------------------------------------------------
 * StaffDao.java 
 * 数据库接口
 * @author  songjinyan
 * @version 1.0, 2018/7/24
 * 
 *-----------------------------------------------------*/
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tpm.bean.Staff;
import com.tpm.tool.JDBCUtils;

public class StaffDao {

	public Staff getStaffBySESAID(String sesaid) {
		String sql = "select id,sesaid,name,sellphone from staff where sesaid = ?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		Staff staff;
		try {
			staff = queryRunner.query(sql, new BeanHandler<Staff>(Staff.class), sesaid);
			if (staff != null) {
				return staff;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Staff userLogin(String sesaid, String password) {
		String sql = "select id,sesaid,name,sellphone from staff where sesaid = ? and password = ?";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		Staff staff;
		try {
			staff = queryRunner.query(sql, new BeanHandler<Staff>(Staff.class), sesaid, password);
			if (staff != null) {
				return staff;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Staff> getAllStaff() {
		// TODO Auto-generated method stub
		String sql = "select id,sesaid,name,sellphone from staff";
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		try {
			List<Staff> list = queryRunner.query(sql, new BeanListHandler<Staff>(Staff.class));
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * // get userDatail by email public UserDetail getUserDetailByEmail(String
	 * email) { String sql = "select * from userDetail where email = ?"; QueryRunner
	 * queryRunner = new QueryRunner(JDBCUtils.getDataSource()); UserDetail
	 * userDetail; try { userDetail = queryRunner .query(sql, new
	 * BeanHandler<UserDetail>(UserDetail.class), email); if(userDetail!=null){
	 * return userDetail; } else { return null; } } catch (SQLException e) {
	 * e.printStackTrace(); } return null; }
	 * 
	 * // get userDatail by ID public UserDetail getUserDetailByID(int user_id) {
	 * String sql = "select * from userDetail where id = ?"; QueryRunner queryRunner
	 * = new QueryRunner(JDBCUtils.getDataSource()); UserDetail userDetail; try {
	 * userDetail = queryRunner .query(sql, new
	 * BeanHandler<UserDetail>(UserDetail.class), user_id); if(userDetail!=null){
	 * return userDetail; } else { return null; } } catch (SQLException e) {
	 * e.printStackTrace(); } return null; }
	 * 
	 * // login checking by username and password public boolean
	 * loginByUsernameAndPassword(String username, String password) { String sql =
	 * "select * from login where username = ? and password= ?"; QueryRunner
	 * queryRunner = new QueryRunner(JDBCUtils.getDataSource()); try { Login login =
	 * queryRunner.query(sql, new BeanHandler<Login>(Login.class), username,
	 * MD5Utils .md5(password)); if(login!=null){ return true; } else { return
	 * false; } } catch (SQLException e) { e.printStackTrace(); throw new
	 * RuntimeException(e); } }
	 * 
	 * // login checking by email and password public boolean
	 * loginByEmailAndPassword(String email, String password) { String sql =
	 * "select * from login where email = ? and password= ?"; QueryRunner
	 * queryRunner = new QueryRunner(JDBCUtils.getDataSource()); try { Login login =
	 * queryRunner.query(sql, new BeanHandler<Login>(Login.class), email, MD5Utils
	 * .md5(password)); if(login!=null) return true; else { return false; } } catch
	 * (SQLException e) { e.printStackTrace(); throw new RuntimeException(e); } }
	 * 
	 * 
	 * // user regist public void insert(Regist regist) { String sql1 =
	 * "insert into login values(null,?,?,?)"; String sql2 =
	 * "select id from schools where schoolname= ?"; String sql3 =
	 * "select id from login where username= ?"; String sql4 =
	 * "insert into users values(?,?,?,null,?)"; QueryRunner queryRunner = new
	 * QueryRunner(JDBCUtils.getDataSource()); Object[] param1 = {
	 * regist.getUsername(), MD5Utils.md5(regist.getPassword()), regist.getEmail()};
	 * try { queryRunner.update(sql1, param1); Login login = queryRunner.query(sql3,
	 * new BeanHandler<Login>(Login.class),regist.getUsername()); School school =
	 * queryRunner.query(sql2, new
	 * BeanHandler<School>(School.class),regist.getSchoolname()); Object[] param2 =
	 * { login.getId(), regist.getTel(), regist.getQq(), school.getId()};
	 * queryRunner.update(sql4, param2);
	 * 
	 * } catch (SQLException e) { e.printStackTrace();
	 * 
	 * throw new RuntimeException(e.getMessage()); } }
	 * 
	 * // Checking is username used public boolean isUsernameUsed(String username) {
	 * String sql = "select * from login where username = ?"; QueryRunner
	 * queryRunner = new QueryRunner(JDBCUtils.getDataSource()); try { Login login =
	 * queryRunner.query(sql, new BeanHandler<Login>(Login.class), username);
	 * if(login!=null) return true; else { return false; } } catch (SQLException e)
	 * { e.printStackTrace(); } return true; }
	 * 
	 * //Checking is email used public boolean isEmailUsed(String email) { String
	 * sql = "select * from login where email = ?"; QueryRunner queryRunner = new
	 * QueryRunner(JDBCUtils.getDataSource()); try { Login login =
	 * queryRunner.query(sql, new BeanHandler<Login>(Login.class), email);
	 * if(login!=null) return true; else { return false; } } catch (SQLException e)
	 * { e.printStackTrace(); } return true; } // get user by email public User
	 * getUserbyEmail(String email){ String sql =
	 * "select * from login where email = ?"; QueryRunner queryRunner = new
	 * QueryRunner(JDBCUtils.getDataSource()); try { User user =
	 * queryRunner.query(sql, new BeanHandler<User>(User.class), email);
	 * if(user!=null){ return user; } else { return null; } } catch (SQLException e)
	 * { e.printStackTrace(); throw new RuntimeException(e); }
	 * 
	 * }
	 * 
	 * // update password public boolean updatePassword(String email,String
	 * password) { String sql = "update login set password = ? where email = ?";
	 * QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource()); try {
	 * queryRunner.update(sql, MD5Utils .md5(password),email); return true; } catch
	 * (SQLException e) { e.printStackTrace(); } return false; }
	 * 
	 * // update userdetail public boolean updateUserDetail(UserDetail userDetail) {
	 * String sql = "update users set  tel = ?,qq = ?,school_id = ? where id = ?";
	 * String sql2 = "update login set username = ? where email = ?"; String sql3 =
	 * "select * from schools where schoolname = ?"; QueryRunner queryRunner = new
	 * QueryRunner(JDBCUtils.getDataSource()); try {
	 * 
	 * School school = queryRunner.query(sql3,new
	 * BeanHandler<School>(School.class),userDetail.getSchoolname());
	 * queryRunner.update(sql2,userDetail.getUsername(),userDetail.getEmail());
	 * queryRunner.update(sql,userDetail.getTel(),userDetail.getQq(),school.getId(),
	 * getUserbyEmail(userDetail.getEmail()).getId()); return true; } catch
	 * (SQLException e) { e.printStackTrace(); } return false; }
	 * 
	 * 
	 * public List<UserDetail> getAllUserDetail() { // TODO Auto-generated method
	 * stub String sql = "select * from userDetail"; QueryRunner queryRunner = new
	 * QueryRunner(JDBCUtils.getDataSource()); try { List<UserDetail> list =
	 * queryRunner.query(sql, new BeanListHandler<UserDetail>(UserDetail.class));
	 * return list;
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } return null; }
	 */

}
