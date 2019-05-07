package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.dao.EquipmentDao;

public class EquipmentList extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();
	private int type;

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "record");
		switch (type) {
		case 1:
			ActionContext.getContext().getSession().put("typename", "设备台账");
			ActionContext.getContext().getSession().put("type_id", 1);
			break;
		case 4:
			ActionContext.getContext().getSession().put("typename", "工装台账");
			ActionContext.getContext().getSession().put("type_id", 4);
			break;
		case 2:
			ActionContext.getContext().getSession().put("typename", "内部模具台账");
			ActionContext.getContext().getSession().put("type_id", 2);
			break;
		case 3:
			ActionContext.getContext().getSession().put("typename", "外部模具台账");
			ActionContext.getContext().getSession().put("type_id", 3);
			break;
		case 5:
			ActionContext.getContext().getSession().put("typename", "扭力工具台账");
			ActionContext.getContext().getSession().put("type_id", 5);
			break;

		default:
			break;
		}
		if (type == 5) {
			return "toollist";
		}
		return "success";

	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
