package com.tpm.bean;

import java.util.List;

public class ServerPagination {

	private long total;
	private List rows;

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List getRow() {
		return rows;
	}

	public void setRow(List row) {
		this.rows = row;
	}

}
