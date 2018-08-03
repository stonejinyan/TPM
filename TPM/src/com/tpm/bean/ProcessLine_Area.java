package com.tpm.bean;

public class ProcessLine_Area {

	public int id;
	public String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ProcessLine_Area [id=" + id + ", name=" + name + "]";
	}

}
