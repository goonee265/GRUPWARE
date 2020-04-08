package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ApprovalDataBean implements Serializable{
	private int empno;			//사원번호
	private int num;			//글번호
	private String header;		//카테고리(글분류)
	private String subject;		//제목
	private String content;		//내용
	private Timestamp reg_date;	//작성시간
	private String confirm;		//문서의 상태를 보여줌
	private String name;		//이름
	private String filename;	//파일이름	
	private int filesize;		//파일사이즈
	private String checkEmpno;	//승인 사원번호 저장할 공간
	private String confirmer;
	private String superior;
	
	
	public String getCheckEmpno() {
		return checkEmpno;
	}
	
	public void setCheckEmpno(String checkEmpno) {
		this.checkEmpno = checkEmpno;
	}
	
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
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}	
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

	public String getConfirmer() {
		return confirmer;
	}

	public void setConfirmer(String confirmer) {
		this.confirmer = confirmer;
	}

	public String getSuperior() {
		return superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}
	
	
	
	
	
	
}