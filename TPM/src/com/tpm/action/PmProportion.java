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
		int[] is = { 0, 0, 0, 0, 0 };
		List<Ｍaintenance_time> maintenance_times = equipmentMaintainDao.getMaintenanceTime();
		for (int i = 0; i < maintenance_times.size(); i++) {
			switch (maintenance_times.get(i).getName()) {
			case "PM":
				is[0] = maintenance_times.get(i).getData();
				break;
			case "RM":
				is[1] = maintenance_times.get(i).getData();
				break;
			case "AM-巡线":
				is[2] = maintenance_times.get(i).getData();
				break;
			case "支援/调机":
				is[3] = maintenance_times.get(i).getData();
				break;
			case "other":
				is[4] = maintenance_times.get(i).getData();
				break;

			default:
				break;
			}
		}
		ActionContext.getContext().put("Json", gson.toJson(is));
		return "success";
	}
}
