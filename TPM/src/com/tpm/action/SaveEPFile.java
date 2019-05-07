package com.tpm.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tpm.bean.EPFiles;
import com.tpm.bean.Staff;
import com.tpm.dao.EPFilesDao;

public class SaveEPFile extends ActionSupport {

	private File uploadfile;// 定义一个File ,变量名要与jsp中的input标签的name一致
	private String uploadfileContentType;// 上传文件的mimeType类型
	private String uploadfileFileName;// 上传文件的名称
	private String name;// 必须是name属性+FileName
	private int id;
	EPFilesDao epFilesDao = new EPFilesDao();

	public String execute() throws Exception {
		// 将客户端的文件上传到服务端

		// 获取要保存文件夹的物理路径(绝对路径)
		String realPath = ServletActionContext.getServletContext().getRealPath("/");
		System.out.println(realPath);
		File myfile = new File(realPath + "/../TPMupLoad");

		// 测试此抽象路径名表示的文件或目录是否存在。若不存在，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
		if (!myfile.exists())
			myfile.mkdirs();

		String filename = new Date().getTime() + uploadfileFileName;
		System.out.println(uploadfile);
		System.out.println(uploadfileContentType);
		System.out.println(uploadfileFileName);
		System.out.println(id);
		System.out.println(name);
		try {
			// 保存文件
			File savefile = new File(myfile, filename);
			FileUtils.copyFile(uploadfile, savefile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		EPFiles epFiles = new EPFiles();
		epFiles.setName(name);
		epFiles.setLink(filename);
		epFiles.setEp_id(id);
		epFiles.setTDDate(new Date());
		epFiles.setStaff_Id(((Staff) ActionContext.getContext().getSession().get("staff")).getId());
		epFilesDao.save(epFiles);
		// ActionContext.getContext().put("ep_id", id);
		ActionContext.getContext().put("active", "Maintain");
		return "success";
	}

	public File getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUploadfileContentType() {
		return uploadfileContentType;
	}

	public void setUploadfileContentType(String uploadfileContentType) {
		this.uploadfileContentType = uploadfileContentType;
	}

	public String getUploadfileFileName() {
		return uploadfileFileName;
	}

	public void setUploadfileFileName(String uploadfileFileName) {
		this.uploadfileFileName = uploadfileFileName;
	};

}
