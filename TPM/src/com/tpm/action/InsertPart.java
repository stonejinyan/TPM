package com.tpm.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.ReplacementPart;
import com.tpm.bean.Staff;
import com.tpm.dao.ReplacementPartDao;
import com.tpm.tool.MD5Utils;

public class InsertPart extends ActionSupport {

	private ReplacementPart replacementPart = new ReplacementPart();
	ReplacementPartDao replacementPartDao = new ReplacementPartDao();

	public String execute() throws Exception {
		int staffid = ((Staff) ActionContext.getContext().getSession().get("staff")).getId();
		replacementPart.setPartscore(MD5Utils.getTwoDecimal(replacementPart.getDeliverycycle() * 0.217812197483059
		        + replacementPart.getPartvalue() * 0.185866408518877
		        + replacementPart.getEpcritical() * 0.209099709583737 + replacementPart.getVicarism() * 0.21297192642788
		        + replacementPart.getVulnerability() * 0.174249757986447));
		if (replacementPart.getPartscore() >= 5) {
			replacementPart.setCritical("关键");
		} else {
			replacementPart.setCritical("非关键");
		}
		replacementPartDao.insert(replacementPart, staffid);
		return "success";

	}

	public ReplacementPart getReplacementPart() {
		return replacementPart;
	}

	public void setReplacementPart(ReplacementPart replacementPart) {
		this.replacementPart = replacementPart;
	}

}
