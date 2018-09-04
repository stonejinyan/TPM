package com.tpm.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.PageBean;
import com.tpm.dao.EquipmentDao;

public class EquipmentList extends ActionSupport {

	EquipmentDao equipmentDao = new EquipmentDao();
	private int type;
	private int pageNow;
	private String epid;
	private String name;
	private int area;
	private int n_m;
	private String sqlString = "";
	private List<Object> param = new ArrayList<Object>();

	public String execute() throws Exception {
		if (type != 0) {
			sqlString = sqlString + " type_id = ?";
			param.add(type);
			if (pageNow == 0) {
				pageNow = 1;
			}
			if (epid != null) {
				sqlString = sqlString + " epid = ?";
				param.add(epid);
			}
			if (name != null) {
				sqlString = sqlString + " epname = ?";
				param.add(name);
			}
			if (area != 0) {
				sqlString = sqlString + " areaname = ?";
				param.add(area);
			}
			if (n_m != 0) {
				sqlString = sqlString + " n_m = ?";
				param.add(n_m);
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

}
