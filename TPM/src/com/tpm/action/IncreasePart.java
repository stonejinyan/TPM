package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.ReplacementPart;
import com.tpm.dao.ReplacementPartDao;

public class IncreasePart extends ActionSupport {

	private ReplacementPart replacementPart = new ReplacementPart();
	ReplacementPartDao replacementPartDao = new ReplacementPartDao();

	public String execute() throws Exception {
		ActionContext.getContext().put("active", "PartList");
		replacementPartDao.update(replacementPart);
		return "success";
	}

	public ReplacementPart getReplacementPart() {
		return replacementPart;
	}

	public void setReplacementPart(ReplacementPart replacementPart) {
		this.replacementPart = replacementPart;
	}

}
