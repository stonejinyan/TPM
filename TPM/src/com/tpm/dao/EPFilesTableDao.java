package com.tpm.dao;

import java.util.List;

import com.tpm.bean.EPFilesTable;

public class EPFilesTableDao extends IBaseDao<EPFilesTable> {

	public static final String tableName = "epfilestable";

	public List<EPFilesTable> getByEPID(int EP_ID) {
		return super.findByForeignId(EP_ID, tableName, "ep_id");
	}
}
