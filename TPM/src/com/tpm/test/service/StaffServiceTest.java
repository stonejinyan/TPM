package com.tpm.test.service;

import org.junit.Test;

import com.tpm.service.StaffService;
import com.tpm.service.TPMService;

public class StaffServiceTest {

	StaffService staffService = new StaffService();
	TPMService TPMService = new TPMService();

	@Test
	public void test() {
		System.out.println("9月MTTR：" + TPMService.getMTTR("2018-11-01", "2018-11-30"));
		System.out.println("9月MTBF：" + TPMService.getMTBF("2018-11-01", "2018-11-30"));
	}

}
