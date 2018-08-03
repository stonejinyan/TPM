package com.tpm.service;

import java.util.List;

import com.tpm.bean.Staff;
import com.tpm.dao.StaffDao;

public class StaffService {

	StaffDao staffDao = new StaffDao();

	public Staff userLogin(Staff staff) {
		return staffDao.userLogin(staff.getSesaid(), staff.getPassword());
	}

	public List<Staff> getAllStaff() {
		return staffDao.getAllStaff();
	}
}
