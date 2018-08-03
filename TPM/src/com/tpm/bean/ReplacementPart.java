package com.tpm.bean;

public class ReplacementPart {

	private int id;
	private String part_id;
	private String domain;
	private String name;
	private String specification;
	private String brand;
	private String userep;
	private int deliverycycle;
	private int partvalue;
	private int epcritical;
	private int vicarism;
	private int vulnerability;
	private double partscore;
	private double critical;
	private int boxtype_id;
	private int max;
	private int order_number;
	private int min;
	private int number;
	private String unit;
	private double price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPart_id() {
		return part_id;
	}

	public void setPart_id(String part_id) {
		this.part_id = part_id;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getUserep() {
		return userep;
	}

	public void setUserep(String userep) {
		this.userep = userep;
	}

	public int getDeliverycycle() {
		return deliverycycle;
	}

	public void setDeliverycycle(int deliverycycle) {
		this.deliverycycle = deliverycycle;
	}

	public int getPartvalue() {
		return partvalue;
	}

	public void setPartvalue(int partvalue) {
		this.partvalue = partvalue;
	}

	public int getEpcritical() {
		return epcritical;
	}

	public void setEpcritical(int epcritical) {
		this.epcritical = epcritical;
	}

	public int getVicarism() {
		return vicarism;
	}

	public void setVicarism(int vicarism) {
		this.vicarism = vicarism;
	}

	public int getVulnerability() {
		return vulnerability;
	}

	public void setVulnerability(int vulnerability) {
		this.vulnerability = vulnerability;
	}

	public double getPartscore() {
		return partscore;
	}

	public void setPartscore(double partscore) {
		this.partscore = partscore;
	}

	public double getCritical() {
		return critical;
	}

	public void setCritical(double critical) {
		this.critical = critical;
	}

	public int getBoxtype_id() {
		return boxtype_id;
	}

	public void setBoxtype_id(int boxtype_id) {
		this.boxtype_id = boxtype_id;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ＲeplacementＰart [id=" + id + ", part_id=" + part_id + ", domain=" + domain + ", name=" + name
		        + ", specification=" + specification + ", brand=" + brand + ", userep=" + userep + ", deliverycycle="
		        + deliverycycle + ", partvalue=" + partvalue + ", epcritical=" + epcritical + ", vicarism=" + vicarism
		        + ", vulnerability=" + vulnerability + ", partscore=" + partscore + ", critical=" + critical
		        + ", boxtype_id=" + boxtype_id + ", max=" + max + ", order_number=" + order_number + ", min=" + min
		        + ", number=" + number + ", unit=" + unit + ", price=" + price + "]";
	}

}
