package com.tpm.bean;

public class Ｍaintenance_time {

	private int data;
	private String name;

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Ｍaintenance_time [data=" + data + ", name=" + name + "]";
	}

}
