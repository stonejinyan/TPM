package com.tpm.test.service;

import org.junit.Test;

import com.tpm.service.StaffService;

public class StaffServiceTest {

	StaffService staffService = new StaffService();

	@Test
	public void test() {
		System.out.println(staffService.getAllStaff());
	}

}
