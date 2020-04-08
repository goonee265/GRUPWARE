package model;

import java.io.Serializable;

public class CalendarDataBean implements Serializable {
	
	private int calendarNum;
	private String calendarContents ;		
	private int calendarYear;
	private int calendarMonth;
	private int calendarDay;
	private int empno;
	
	
	public int getCalendarNum() {
		return calendarNum;
	}
	public void setCalendarNum(int calendarNum) {
		this.calendarNum = calendarNum;
	}
	public String getCalendarContents() {
		return calendarContents;
	}
	public void setCalendarContents(String calendarContents) {
		this.calendarContents = calendarContents;
	}
	public int getCalendarYear() {
		return calendarYear;
	}
	public void setCalendarYear(int calendarYear) {
		this.calendarYear = calendarYear;
	}
	public int getCalendarMonth() {
		return calendarMonth;
	}
	public void setCalendarMonth(int calendarMonth) {
		this.calendarMonth = calendarMonth;
	}
	public int getCalendarDay() {
		return calendarDay;
	}
	public void setCalendarDay(int calendarDay) {
		this.calendarDay = calendarDay;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	

	
}