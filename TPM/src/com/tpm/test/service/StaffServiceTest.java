package com.tpm.test.service;

import org.junit.Test;

import com.tpm.service.StaffService;
import com.tpm.service.TPMService;

public class StaffServiceTest {

	StaffService staffService = new StaffService();
	TPMService TPMService = new TPMService();

	@Test
	public void test() {
//		System.out.println("9月MTTR：" + TPMService.getMTTR("2018-09-01", "2018-09-30"));
//		System.out.println("10月MTTR：" + TPMService.getMTTR("2018-10-01", "2018-10-30"));
//		System.out.println("11月MTTR：" + TPMService.getMTTR("2018-11-01", "2018-11-30"));
//		System.out.println("12月MTTR：" + TPMService.getMTTR("2018-12-01", "2018-12-30"));
//		System.out.println("9月MTBF：" + TPMService.getMTBF("2018-09-01", "2018-09-30"));
//		System.out.println("10月MTBF：" + TPMService.getMTBF("2018-10-01", "2018-10-30"));
		// System.out.println("11月MTBF：" + TPMService.getMTBF("2018-11-01",
		// "2018-11-30"));
		// System.out.println("12月MTBF：" + TPMService.getMTBF("2018-12-01",
		// "2018-12-30"));
		System.out.println("1月MTTR：" + TPMService.getMTTR("2019-01-01", "2019-01-31"));
		System.out.println("2月MTTR：" + TPMService.getMTTR("2019-02-01", "2019-02-28"));
		System.out.println("3月MTTR：" + TPMService.getMTTR("2019-03-01", "2019-03-31 23:59:59"));
		// System.out.println("1月MTBF：" + TPMService.getMTBF("2019-01-01",
		// "2019-01-31"));
	}

}
