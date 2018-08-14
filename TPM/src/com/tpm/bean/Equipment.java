package com.tpm.bean;

public class Equipment {

	private int id;
	private String epid;
	private String name;
	private String description;
	private int status;
	private int critical;
	private int environmental_impact;
	private int output_impact;
	private int ep_complexity;
	private int ep_manufacturing_channel;
	private int ep_cost;
	private double ep_score;
	private String backup_plan;
	private int check_method;
	private int check_cycle;
	private int check_staff_id;
	private int maintain_staff_id;
	private String property_id;
	private int attribute;
	private int save_area_id;
	private int type;
	private Staff check_staff = new Staff();
	private Staff maintain_staff = new Staff();
	private ProcessLine_Area processLine_Area = new ProcessLine_Area();

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCritical() {
		return critical;
	}

	public void setCritical(int critical) {
		this.critical = critical;
	}

	public int getEnvironmental_impact() {
		return environmental_impact;
	}

	public void setEnvironmental_impact(int environmental_impact) {
		this.environmental_impact = environmental_impact;
	}

	public int getOutput_impact() {
		return output_impact;
	}

	public void setOutput_impact(int output_impact) {
		this.output_impact = output_impact;
	}

	public int getEp_complexity() {
		return ep_complexity;
	}

	public void setEp_complexity(int ep_complexity) {
		this.ep_complexity = ep_complexity;
	}

	public int getEp_manufacturing_channel() {
		return ep_manufacturing_channel;
	}

	public void setEp_manufacturing_channel(int ep_manufacturing_channel) {
		this.ep_manufacturing_channel = ep_manufacturing_channel;
	}

	public int getEp_cost() {
		return ep_cost;
	}

	public void setEp_cost(int ep_cost) {
		this.ep_cost = ep_cost;
	}

	public double getEp_score() {
		return ep_score;
	}

	public void setEp_score(double ep_score) {
		this.ep_score = ep_score;
	}

	public String getBackup_plan() {
		return backup_plan;
	}

	public void setBackup_plan(String backup_plan) {
		this.backup_plan = backup_plan;
	}

	public int getCheck_method() {
		return check_method;
	}

	public void setCheck_method(int check_method) {
		this.check_method = check_method;
	}

	public int getCheck_cycle() {
		return check_cycle;
	}

	public void setCheck_cycle(int check_cycle) {
		this.check_cycle = check_cycle;
	}

	public int getCheck_staff_id() {
		return check_staff_id;
	}

	public void setCheck_staff_id(int check_staff_id) {
		this.check_staff_id = check_staff_id;
	}

	public int getMaintain_staff_id() {
		return maintain_staff_id;
	}

	public void setMaintain_staff_id(int maintain_staff_id) {
		this.maintain_staff_id = maintain_staff_id;
	}

	public String getProperty_id() {
		return property_id;
	}

	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}

	public int getAttribute() {
		return attribute;
	}

	public void setAttribute(int attribute) {
		this.attribute = attribute;
	}

	public int getSave_area_id() {
		return save_area_id;
	}

	public void setSave_area_id(int save_area_id) {
		this.save_area_id = save_area_id;
	}

	public Staff getCheck_staff() {
		return check_staff;
	}

	public void setCheck_staff(Staff check_staff) {
		this.check_staff = check_staff;
	}

	public Staff getMaintain_staff() {
		return maintain_staff;
	}

	public void setMaintain_staff(Staff maintain_staff) {
		this.maintain_staff = maintain_staff;
	}

	public ProcessLine_Area getProcessLine_Area() {
		return processLine_Area;
	}

	public void setProcessLine_Area(ProcessLine_Area processLine_Area) {
		this.processLine_Area = processLine_Area;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Equipment [id=" + id + ", epid=" + epid + ", name=" + name + ", description=" + description
		        + ", status=" + status + ", critical=" + critical + ", environmental_impact=" + environmental_impact
		        + ", output_impact=" + output_impact + ", ep_complexity=" + ep_complexity
		        + ", ep_manufacturing_channel=" + ep_manufacturing_channel + ", ep_cost=" + ep_cost + ", ep_score="
		        + ep_score + ", backup_plan=" + backup_plan + ", check_method=" + check_method + ", check_cycle="
		        + check_cycle + ", check_staff_id=" + check_staff_id + ", maintain_staff_id=" + maintain_staff_id
		        + ", property_id=" + property_id + ", attribute=" + attribute + ", save_area_id=" + save_area_id
		        + ", type=" + type + ", check_staff=" + check_staff + ", maintain_staff=" + maintain_staff
		        + ", processLine_Area=" + processLine_Area + "]";
	}

}
