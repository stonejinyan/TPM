package com.tpm.bean;


public class Staff {

	private int id;
	private String sesaid;
	private String name;
	private String password;
	private String sellphone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSesaid() {
		return sesaid;
	}
	public void setSesaid(String sesaid) {
		this.sesaid = sesaid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSellphone() {
		return sellphone;
	}
	public void setSellphone(String sellphone) {
		this.sellphone = sellphone;
	}
	@Override
	public String toString() {
		return "Staff [id=" + id + ", sesaid=" + sesaid + ", name=" + name + ", password=" + password + ", sellphone="
		        + sellphone + "]";
	}
	
	}
