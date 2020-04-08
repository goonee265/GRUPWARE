package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class NoticeDataBean implements Serializable{
	int empno;			
	int num;				
	String subject;		
	Timestamp reg_date;	
	String content;		
	String filename;	
	int filesize;		

	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	@Override
	public String toString() {
		return "BoardDataBean [empno=" + empno + ", num=" + num + ", subject=" + subject + ", reg_date=" + reg_date
				+ ", content=" + content + ", filename=" + filename + ", filesize=" + filesize + "]";
	}
	
		

}