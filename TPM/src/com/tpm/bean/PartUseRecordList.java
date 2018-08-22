package com.tpm.bean;

import java.sql.Date;

public class PartUseRecordList {

	private int id;
	private String part_id;
	private String partname;
	private int use_number;
	private String typename;
	private String epname;
	private Date time;
	private String epid;
	private String domain;
	private String specification;
	private String brand;
	private String userep;
	private int order_number;
	private int number;
	private String unit;
	private String staffname;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPart_id() {
		return part_id;
	}

	public void setPart_id(String part_id) {
		this.part_id = part_id;
	}

	public String getPartname() {
		return partname;
	}

	public void setPartname(String partname) {
		this.partname = partname;
	}

	public int getUse_number() {
		return use_number;
	}

	public void setUse_number(int use_number) {
		this.use_number = use_number;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getEpname() {
		return epname;
	}

	public void setEpname(String epname) {
		this.epname = epname;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getEpid() {
		return epid;
	}

	public void setEpid(String epid) {
		this.epid = epid;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getUserep() {
		return userep;
	}

	public void setUserep(String userep) {
		this.userep = userep;
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}

	@Override
	public String toString() {
		return "PartUseRecordList [id=" + id + ", part_id=" + part_id + ", partname=" + partname + ", use_number="
		        + use_number + ", typename=" + typename + ", epname=" + epname + ", time=" + time + ", epid=" + epid
		        + ", domain=" + domain + ", specification=" + specification + ", brand=" + brand + ", userep=" + userep
		        + ", order_number=" + order_number + ", number=" + number + ", unit=" + unit + ", staffname="
		        + staffname + "]";
	}

}
