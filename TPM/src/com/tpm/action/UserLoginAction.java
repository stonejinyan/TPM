package com.tpm.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.Staff;
import com.tpm.service.StaffService;
import com.tpm.tool.LogUtil;

public class UserLoginAction extends ActionSupport {
	StaffService staffService = new StaffService();
	Staff staff = new Staff();
	private String error = "123";

	public String execute() throws Exception {
		staff = staffService.userLogin(staff);
		if (staff != null) {
			ActionContext.getContext().getSession().remove("error");
			ActionContext.getContext().getSession().put("staff", staff);
			LogUtil.RollingFile.info(staff.getName() + "登录成功");
			return "home";
		} else {
			System.out.println("save error message");
			error = "账号或密码错误";
			ActionContext.getContext().getSession().put("error", error);
			return Action.LOGIN;
		}
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

}
