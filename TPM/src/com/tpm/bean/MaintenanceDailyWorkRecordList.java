package com.tpm.bean;

import java.sql.Date;

public class MaintenanceDailyWorkRecordList {

	private int id;
	private String question_description;
	private String process_description;
	private int pm_id;
	private Date time;
	private String staffname;
	private double user_time;
	private String epid;
	private String epname;
	private String areaname;
	private String maintenancetypename;
	private int status_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion_description() {
		return question_description;
	}

	public void setQuestion_description(String question_description) {
		this.question_description = question_description;
	}

	public String getProcess_description() {
		return process_description;
	}

	public void setProcess_description(String process_description) {
		this.process_description = process_description;
	}

	public int getPm_id() {
		return pm_id;
	}

	public void setPm_id(int pm_id) {
		this.pm_id = pm_id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}

	public double getUser_time() {
		return user_time;
	}

	public void setUser_time(double user_time) {
		this.user_time = user_time;
	}

	public String getEpname() {
		return epname;
	}

	public void setEpname(String epname) {
		this.epname = epname;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getMaintenancetypename() {
		return maintenancetypename;
	}

	public void setMaintenancetypename(String maintenancetypename) {
		this.maintenancetypename = maintenancetypename;
	}

	public String getEpid() {
		return epid;
	}

	public void setEpid(String epid) {
		this.epid = epid;
	}

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

}
