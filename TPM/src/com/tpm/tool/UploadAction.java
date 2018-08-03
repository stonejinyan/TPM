package com.tpm.tool;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
/*
 * 
 * �ϴ�ͼƬ
 */
public class UploadAction extends ActionSupport {

	private File doc;					//��װ�ϴ��ļ�������
	private String docContentType;			//��װ�ϴ��ļ�������
	private String docFileName;			//��װ�ϴ��ļ���
	private String targetFileName;		//�����µ��ϴ��ļ���
	private String dir;					//��װ�ļ��ϴ��ı���λ��

	public File getDoc() {
		return doc;
	}
	public void setDoc(File doc) {
		this.doc = doc;
	}
	
	public String getDocContentType() {
		return docContentType;
	}
	public void setDocContentType(String docContentType) {
		this.docContentType = docContentType;
	}
	public String getDocFileName() {
		return docFileName;
	}
	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}
	public String getTargetFileName() {
		return targetFileName;
	}
	public void setTargetFileName(String targetFileName) {
		this.targetFileName = targetFileName;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	
	public String execute(){
		String realPath = ServletActionContext.getRequest().getRealPath("/upload");
		String targetDirectory=realPath;

		System.out.println(this.getDocFileName());
		if(docFileName== null || "".equals(docFileName.trim())){	//���ļ��ϴ�	
			this.addFieldError("doc", "�ļ�����Ϊ��");
		}else{
			targetFileName=generateFileName(docFileName);		//���ɱ����ļ����ļ�����
			System.out.println(targetFileName);
			setDir(targetDirectory+"\\"+targetFileName);	//���ñ����ļ���·��
			System.out.println(targetDirectory+"\\"+targetFileName);
			File target=new File(targetDirectory,targetFileName);	//����һ��Ŀ���ļ�
			
			try{
				FileUtils.copyFile(doc, target);		//����ʱ�ļ����Ƶ�Ŀ���ļ�
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
			
		return null;		
	}
	
	private String generateFileName(String fileName){
		DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String formatDate=format.format(new Date());	//��ȡ��ǰʱ�䣬��ת����һ����ʽ
		int random=new Random().nextInt(10000);			//��������ļ����
		int position =fileName.lastIndexOf(".");		//����ļ���׺����
		String extension=fileName.substring(position);	//��ȡ�ļ���׺��
		String newfileName=formatDate+random+extension;	//���һ���µ��ļ�����
		
		return newfileName;
	}
}
