package com.tpm.test.dao;

import org.junit.Test;

import com.google.gson.Gson;
import com.tpm.dao.EquipmentDao;

public class EquipmentDaoTest {

	EquipmentDao equipmentDao = new EquipmentDao();

	@Test
	public void test() {
		Gson gson = new Gson();
		String jsonString = gson.toJson(equipmentDao.getAllEquipment());
		System.out.println(jsonString);
	}

}
