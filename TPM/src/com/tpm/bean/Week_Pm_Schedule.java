package com.tpm.bean;

public class Week_Pm_Schedule {

	private int id;
	private String epid;
	private String epname;
	private String time;

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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Week_Pm_Schedule [id=" + id + ", epid=" + epid + ", epname=" + epname + ", time=" + time + "]";
	}

}
