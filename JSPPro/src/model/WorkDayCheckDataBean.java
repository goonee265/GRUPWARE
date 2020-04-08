package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class WorkDayCheckDataBean implements Serializable {
    int empno;
    String workdate;
    String workmin;
    String workmax;
    String result;
    

    
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getWorkdate() {
		return workdate;
	}
	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}
	public String getWorkmin() {
		return workmin;
	}
	public void setWorkmin(String workmin) {
		this.workmin = workmin;
	}
	public String getWorkmax() {
		return workmax;
	}
	public void setWorkmax(String workmax) {
		this.workmax = workmax;
	}
	
    
	
	
  
    
}