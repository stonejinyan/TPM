package com.tpm.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.PageBean;
import com.tpm.dao.EquipmentDao;
import com.tpm.dao.ProcessLine_AreaDao;

public class EquipmentList extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();
	ProcessLine_AreaDao processLine_AreaDao = new ProcessLine_AreaDao();
	private int type;
	private int pageNow;
	private String epid;
	private String name;
	private int area;
	private int n_m;
	private int critical_id = -1;
	private String sqlString = "";
	private List<Object> param = new ArrayList<Object>();

	public String execute() throws Exception {
		if (type != 0) {
			sqlString = sqlString + " type_id = ?";
			param.add(type);
			if (pageNow == 0) {
				pageNow = 1;
			}
			if (epid != null && epid != "") {
				sqlString = sqlString + " and epid = ?";
				param.add(epid);
			}
			if (name != null && name != "") {
				sqlString = sqlString + " and epname like ?";
				param.add("%" + name + "%");
			}
			if (area != 0) {
				sqlString = sqlString + " and areaid = ?";
				param.add(area);
			}
			if (n_m != 0) {
				sqlString = sqlString + " and n_m = ?";
				param.add(n_m);
			}
			if (critical_id == 0 || critical_id == 1 || critical_id == 3) {
				sqlString = sqlString + " and critical_id = ?";
				param.add(critical_id);
			}
			ActionContext.getContext().getSession().put("param", param);
			ActionContext.getContext().getSession().put("sqlString", sqlString);
			ActionContext.getContext().getSession().put("type", type);
		} else {
			param = (List<Object>) ActionContext.getContext().getSession().get("param");
			param.remove(param.size() - 1);
			sqlString = (String) ActionContext.getContext().getSession().get("sqlString");
			type = (int) ActionContext.getContext().getSession().get("type");
		}

		int pageTotalSize = equipmentDao.getPageTotalSize(sqlString, param.toArray());
		PageBean pageBean = new PageBean(pageNow, pageTotalSize);
		ActionContext.getContext().put("pageNumbers", pageBean.getPageNumber());
		ActionContext.getContext().put("pageBean", pageBean);
		param.add(((pageBean.getPageNow() - 1) * pageBean.getPageSize()));
		ActionContext.getContext().put("equipmentlist",
		        equipmentDao.getAllEquipmentListByType(sqlString, param.toArray()));
		// PageBean pageBean = new PageBean(1, equipmentDao.getPagetotalSize());
		// ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("processLine_AreaList", processLine_AreaDao.getAllProcessLine_Area());
		ActionContext.getContext().put("active", "record");
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

	public EquipmentDao getEquipmentDao() {
		return equipmentDao;
	}

	public void setEquipmentDao(EquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public String getEpid() {
		return epid;
	}

	public void setEpid(String epid) {
		this.epid = epid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getN_m() {
		return n_m;
	}

	public void setN_m(int n_m) {
		this.n_m = n_m;
	}

	public int getCritical_id() {
		return critical_id;
	}

	public void setCritical_id(int critical_id) {
		this.critical_id = critical_id;
	}

}
