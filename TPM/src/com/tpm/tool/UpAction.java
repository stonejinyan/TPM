package com.tpm.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UpAction extends ActionSupport {
	private File upload;				//��װ�ϴ��ļ�������
	private String uploadContentType;	//��װ�ϴ��ļ�������
	private String uploadFileName;		//��װ�ϴ��ļ���
	private String savaPath;			//��װ�ļ��ϴ��ı���λ��
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getSavaPath() {
		return ServletActionContext.getRequest().getRealPath(savaPath);
	}
	public void setSavaPath(String savaPath) {
		this.savaPath = savaPath;
	}
	
	public String execute() throws IOException{
		String fileName=getSavaPath()+"\\"+getUploadFileName();		//����·������
		
		System.out.println(fileName);
		
		FileOutputStream fos=new FileOutputStream(fileName);		//�������������fos

		FileInputStream fis=new FileInputStream(getUpload());		//��������������fis
		
		byte[] b=new byte[1024];				//�����ֽ�����b
		int len=0;								//������ʱ��������
		while((len=fis.read(b))>0){
			fos.write(b, 0, len);				//���������ֽ���ʽд��
		}
		return SUCCESS;
		
	}
}
