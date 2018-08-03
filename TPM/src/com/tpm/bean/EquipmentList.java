package com.tpm.bean;

public class EquipmentList {

	private int id;
	private String epid;
	private String epname;
	private String description;
	private int ep_score;
	private String backup_plan;
	private int check_cycle;
	private String checkstaffname;
	private String attribute;
	private String status;
	private String areaname;
	private String criticalname;
	private String maintainstaffname;
	private String checkmethodname;
	private String property_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEpid() {
		return epid;
	}

	public void setEpid(String epid) {
		this.epid = epid;
	}

	public String getEpname() {
		return epname;
	}

	public void setEpname(String epname) {
		this.epname = epname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getEp_score() {
		return ep_score;
	}

	public void setEp_score(int ep_score) {
		this.ep_score = ep_score;
	}

	public String getBackup_plan() {
		return backup_plan;
	}

	public void setBackup_plan(String backup_plan) {
		this.backup_plan = backup_plan;
	}

	public int getCheck_cycle() {
		return check_cycle;
	}

	public void setCheck_cycle(int check_cycle) {
		this.check_cycle = check_cycle;
	}

	public String getCheckstaffname() {
		return checkstaffname;
	}

	public void setCheckstaffname(String checkstaffname) {
		this.checkstaffname = checkstaffname;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getCriticalname() {
		return criticalname;
	}

	public void setCriticalname(String criticalname) {
		this.criticalname = criticalname;
	}

	public String getMaintainstaffname() {
		return maintainstaffname;
	}

	public void setMaintainstaffname(String maintainstaffname) {
		this.maintainstaffname = maintainstaffname;
	}

	public String getCheckmethodname() {
		return checkmethodname;
	}

	public void setCheckmethodname(String checkmethodname) {
		this.checkmethodname = checkmethodname;
	}

	public String getProperty_id() {
		return property_id;
	}

	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}

	@Override
	public String toString() {
		return "EquipmentList [id=" + id + ", epid=" + epid + ", epname=" + epname + ", description=" + description
		        + ", ep_score=" + ep_score + ", backup_plan=" + backup_plan + ", check_cycle=" + check_cycle
		        + ", checkstaffname=" + checkstaffname + ", attribute=" + attribute + ", status=" + status
		        + ", areaname=" + areaname + ", criticalname=" + criticalname + ", maintainstaffname="
		        + maintainstaffname + ", checkmethodname=" + checkmethodname + ", property_id=" + property_id + "]";
	}

}
