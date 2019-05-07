package com.tpm.dao;

import java.util.List;

import com.tpm.bean.EPFiles;
import com.tpm.bean.EPFilesTable;

public class EPFilesDao extends IBaseDao<EPFiles> {

	public static final String tableName = "epfiles";

	public boolean save(EPFiles epFiles) {
		return super.save(epFiles, tableName);
	}

	public List<EPFilesTable> getByEPID(int EP_ID) {
		return super.findByForeignId(EP_ID, tableName, "ep_id");
	}
}