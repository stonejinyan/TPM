package com.tpm.bean;

public class UseRecord {

	private int id;
	private int staff_id;
	private int replacement_part_id;
	private int maintenance_daily_work_record_id;
	private int use_number;
	private String part_id;
	private String status_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}

	public int getReplacement_part_id() {
		return replacement_part_id;
	}

	public void setReplacement_part_id(int replacement_part_id) {
		this.replacement_part_id = replacement_part_id;
	}

	public int getMaintenance_daily_work_record_id() {
		return maintenance_daily_work_record_id;
	}

	public void setMaintenance_daily_work_record_id(int maintenance_daily_work_record_id) {
		this.maintenance_daily_work_record_id = maintenance_daily_work_record_id;
	}

	public int getUse_number() {
		return use_number;
	}

	public void setUse_number(int use_number) {
		this.use_number = use_number;
	}

	public String getPart_id() {
		return part_id;
	}

	public void setPart_id(String part_id) {
		this.part_id = part_id;
	}

	public String getStatus_id() {
		return status_id;
	}

	public void setStatus_id(String status_id) {
		this.status_id = status_id;
	}

}
