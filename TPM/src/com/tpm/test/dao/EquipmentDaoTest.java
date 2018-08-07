package com.tpm.test.dao;

import java.util.List;

import org.junit.Test;

import com.tpm.bean.Equipment;
import com.tpm.bean.ReplacementPart;
import com.tpm.dao.EquipmentDao;
import com.tpm.dao.ReplacementPartDao;
import com.tpm.tool.MD5Utils;

public class EquipmentDaoTest {

	EquipmentDao equipmentDao = new EquipmentDao();

	@Test
	public void test() {
		List<Equipment> equipments = equipmentDao.getAllEquipments();
		for (int i = 0; i < equipments.size(); i++) {
			Equipment equipment = equipments.get(i);
			double f = equipment.getEnvironmental_impact() * 0.212355212355212
			        + equipment.getOutput_impact() * 0.231660231660232
			        + equipment.getEp_complexity() * 0.208494208494208
			        + equipment.getEp_manufacturing_channel() * 0.173745173745174
			        + equipment.getEp_cost() * 0.173745173745174;
			f = MD5Utils.getTwoDecimal(f);
			if (f >= 5) {
				equipment.setCritical(1);
			} else {
				equipment.setCritical(0);
			}
			equipment.setEp_score(f);
			equipmentDao.updateEPScore(equipment);
			System.out.println("---------" + i + "----" + f + "----");
		}
	}

	@Test
	public void mytest() {
		ReplacementPartDao replacementPartDao = new ReplacementPartDao();
		List<ReplacementPart> replacementParts = replacementPartDao.getAllReplacementParts();
		for (int i = 0; i < replacementParts.size(); i++) {
			ReplacementPart replacementPart = replacementParts.get(i);
			double d = MD5Utils.getTwoDecimal(replacementPart.getDeliverycycle() * 0.217812197483059
			        + replacementPart.getPartvalue() * 0.185866408518877
			        + replacementPart.getEpcritical() * 0.209099709583737
			        + replacementPart.getVicarism() * 0.21297192642788
			        + replacementPart.getVulnerability() * 0.174249757986447);
			replacementPart.setPartscore(d);
			if (d >= 5) {
				replacementPart.setCritical("关键");
			} else {
				replacementPart.setCritical("非关键");
			}
			replacementPartDao.updateCritical(replacementPart);
			System.out.println(i + "---" + d + replacementPart.getId());
		}

	}

}
