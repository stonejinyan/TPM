package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.Equipment;
import com.tpm.dao.EquipmentDao;
import com.tpm.tool.MD5Utils;

public class InsertEquipment extends ActionSupport {

	private Equipment equipment = new Equipment();
	EquipmentDao equipmentDao = new EquipmentDao();

	public String execute() throws Exception {
		double f = equipment.getEnvironmental_impact() * 0.212355212355212
		        + equipment.getOutput_impact() * 0.231660231660232 + equipment.getEp_complexity() * 0.208494208494208
		        + equipment.getEp_manufacturing_channel() * 0.173745173745174
		        + equipment.getEp_cost() * 0.173745173745174;
		f = MD5Utils.getTwoDecimal(f);
		if (f >= 5) {
			equipment.setCritical(1);
		} else {
			equipment.setCritical(0);
		}
		equipment.setEp_score(f);
		equipmentDao.insert(equipment);
		ActionContext.getContext().getSession().put("error", "");
		return "success";

	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}
}
