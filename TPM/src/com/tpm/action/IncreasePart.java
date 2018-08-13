package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.ReplacementPart;
import com.tpm.bean.Staff;
import com.tpm.dao.ReplacementPartDao;

public class IncreasePart extends ActionSupport {

	private ReplacementPart replacementPart = new ReplacementPart();
	ReplacementPartDao replacementPartDao = new ReplacementPartDao();

	public String execute() throws Exception {
		int staffid = ((Staff) ActionContext.getContext().getSession().get("staff")).getId();
		ActionContext.getContext().put("active", "PartList");
		replacementPartDao.update(replacementPart, staffid);
		return "success";
	}

	public ReplacementPart getReplacementPart() {
		return replacementPart;
	}

	public void setReplacementPart(ReplacementPart replacementPart) {
		this.replacementPart = replacementPart;
	}

}
