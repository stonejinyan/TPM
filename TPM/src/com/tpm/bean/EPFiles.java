package com.tpm.bean;

import java.util.Date;

public class EPFiles {

	private int id;
	private String name;
	private String link;
	private int ep_id;
	private Date TDDate;
	private int staff_Id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return "<a href='../TPMupLoad/" + link + "' target='view_window'>" + name + "</a>";
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getEp_id() {
		return ep_id;
	}

	public void setEp_id(int ep_id) {
		this.ep_id = ep_id;
	}

	public Date getTDDate() {
		return TDDate;
	}

	public void setTDDate(Date tDDate) {
		TDDate = tDDate;
	}

	public int getStaff_Id() {
		return staff_Id;
	}

	public void setStaff_Id(int staff_Id) {
		this.staff_Id = staff_Id;
	}

}
