package com.tpm.bean;

public class Equipment_Attribute {

	public int id;
	public String attribute;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	@Override
	public String toString() {
		return "Equipment_Attribute [id=" + id + ", attribute=" + attribute + "]";
	}

}
