package com.tpm.bean;

import java.sql.Date;

public class PMSchedule {

	private int id;
	private int ep_id;
	private Date schedule_time;
	private String finish;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEp_id() {
		return ep_id;
	}

	public void setEp_id(int ep_id) {
		this.ep_id = ep_id;
	}

	public Date getSchedule_time() {
		return schedule_time;
	}

	public void setSchedule_time(Date schedule_time) {
		this.schedule_time = schedule_time;
	}

	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}

	@Override
	public String toString() {
		return "PMSchedule [id=" + id + ", ep_id=" + ep_id + ", schedule_time=" + schedule_time + ", finish=" + finish
		        + "]";
	}

}
