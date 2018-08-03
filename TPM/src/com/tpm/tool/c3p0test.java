package com.tpm.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.junit.Test;

import com.tpm.dao.StaffDao;


public class c3p0test {

	StaffDao staffDao = new StaffDao();
	
	@Test
	public void test2(){
		
		System.out.println(staffDao.getStaffBySESAID("SESA511463"));

	}
}