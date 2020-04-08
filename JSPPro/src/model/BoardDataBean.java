package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class BoardDataBean implements Serializable{
	private int empno;			//사원번호
	private int num;			//글번호
	private String header;		//말머리 번호(글분류)
	private String subject;		//글 제목
	private Timestamp reg_date;	//글 작성 시간
	private String content;		//글 내용
	private int readcount;		//조회 횟수
	private int ref;			//댓글 원글
	private int re_step;		//답글 1
	private int re_level;		//답글 2
	private String name;		//이름
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	@Override
	public String toString() {
		return "BoardDataBean [empno=" + empno + ", num=" + num + ", header=" + header + ", subject=" + subject
				+ ", reg_date=" + reg_date + ", content=" + content + ", readcount=" + readcount + ", ref=" + ref
				+ ", re_step=" + re_step + ", re_level=" + re_level + "]";
	}	
}