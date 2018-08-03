package com.tpm.tool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @author songjinyan
 * 
 */
public class JDBCUtils {
	private static DataSource dataSource = new ComboPooledDataSource();

	public static DataSource getDataSource() {
		return dataSource;
	}

	/**
	 * DBUtils
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	// 
	public static String generateOrderId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "order-" + hashCode;
	}

	//
	public static String generateProductId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "book-" + hashCode;
	}
	
	//
	public static String generateAddressId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "address-" + hashCode;
	}
	public static String generateRoleId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "role-" + hashCode;
	}
	public static String generateEvaluateId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "evaluate-" + hashCode;
	}
	
	public static String generateprovinceId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "province-" + hashCode;
	}
	
	public static String generateSchoolId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "school-" + hashCode;
	}
	
	public static String generateAcademyId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "academy-" + hashCode;
	}
	
	public static String generateMajorId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "major-" + hashCode;
	}
	
	public static String generateBookClassifyId() {
		String uuid = UUID.randomUUID().toString(); // xxxx-xxx-xxx-xxxx-xxx
		int hashCode = Math.abs(uuid.hashCode());
		return "bookClassify-" + hashCode;
	}
	
}
