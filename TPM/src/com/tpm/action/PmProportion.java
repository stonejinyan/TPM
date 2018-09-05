package com.tpm.action;

import java.util.List;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.Ｍaintenance_time;
import com.tpm.dao.EquipmentMaintainDao;

public class PmProportion extends ActionSupport {

	public String execute() throws Exception {
		EquipmentMaintainDao equipmentMaintainDao = new EquipmentMaintainDao();
		Gson gson = new Gson();
		int[] is = { 0, 0, 0, 0 };
		int[] PmProportion = { 0, 0, 0, 0, };
		List<Ｍaintenance_time> maintenance_times = equipmentMaintainDao.getMaintenanceTime();
		for (int i = 0; i < maintenance_times.size(); i++) {
			switch (maintenance_times.get(i).getName()) {
			case "PM":
				is[0] = is[0] + maintenance_times.get(i).getData();
				break;
			case "PM-巡线":
				is[0] = is[0] + maintenance_times.get(i).getData();
				break;
			case "RM":
				is[1] = maintenance_times.get(i).getData();
				break;
			case "Other":
				is[2] = maintenance_times.get(i).getData();
				break;

			default:
				break;
			}
		}
		PmProportion[0] = is[0] * 100 / (is[0] + is[1] + is[2]);
		PmProportion[1] = is[1] * 100 / (is[0] + is[1] + is[2]);
		PmProportion[2] = is[2] * 100 / (is[0] + is[1] + is[2]);
		ActionContext.getContext().put("Json", gson.toJson(PmProportion));
		return "success";
	}
}
