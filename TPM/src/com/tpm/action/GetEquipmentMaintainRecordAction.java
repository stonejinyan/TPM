package com.tpm.action;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.ServerPagination;
import com.tpm.dao.MaintenanceDailyWorkRecordListDao;

public class GetEquipmentMaintainRecordAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private int limit;
	private int offset;
	private String order;
	MaintenanceDailyWorkRecordListDao maintenanceDailyWorkRecordListDao = new MaintenanceDailyWorkRecordListDao();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

	public String execute() throws Exception {
		if (limit != 0) {
			ServerPagination serverPagination = maintenanceDailyWorkRecordListDao.getAll(offset, limit, order);
			ActionContext.getContext().put("Json", gson.toJson(serverPagination));
		}
		return "success";

	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}
