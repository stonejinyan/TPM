package com.tpm.bean;

import java.sql.Date;

public class MaintenanceDailyWorkRecord {

	private int id;
	private String question_description;
	private String process_description;
	private int type;
	private int pm_id;
	private Date time;
	private int staff_id;
	private double user_time;
	private int ep_id;

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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public int getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}

	public double getUser_time() {
		return user_time;
	}

	public void setUser_time(double user_time) {
		this.user_time = user_time;
	}

	public int getEp_id() {
		return ep_id;
	}

	public void setEp_id(int ep_id) {
		this.ep_id = ep_id;
	}

	@Override
	public String toString() {
		return "MaintenanceDailyWorkRecord [id=" + id + ", question_description=" + question_description
		        + ", process_description=" + process_description + ", type=" + type + ", pm_id=" + pm_id + ", time="
		        + time + ", staff_id=" + staff_id + ", user_time=" + user_time + ", ep_id=" + ep_id + "]";
	}

}
