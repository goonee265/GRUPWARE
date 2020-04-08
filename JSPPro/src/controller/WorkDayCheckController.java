package controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisWorkDayCheckDao;
import model.WorkDayCheckDataBean;

@SuppressWarnings("serial")
public class WorkDayCheckController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	}

	// workDayCheck
	@RequestMapping(value = "workDayCheck", method = RequestMethod.GET)
	public String workDayCheck_workDayCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		session.getAttribute("memEmpno");

		return "/view/workDayCheck/workDayCheck.jsp";
	}

	// workDayCheckPro
	@RequestMapping(value = "workDayCheckPro", method = RequestMethod.POST)
	public String workDayCheck_workDayCheckPro(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Timestamp workdate = new Timestamp(System.currentTimeMillis());

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sf.format(workdate);

		request.setCharacterEncoding("UTF-8");

		String empno = (String) session.getAttribute("memEmpno");
		/* empno = "1"; */

		/*WorkDayCheckDao employeeDao = WorkDayCheckDao.getInstance();*/
		MybatisWorkDayCheckDao employeeDao = MybatisWorkDayCheckDao.getInstance();
		employeeDao.insertTime(Integer.parseInt(empno), workdate);

		return "/view/workDayCheck/workDayCheckPro.jsp";

	}

	// workDayCheckForm
	@RequestMapping(value = "workDayCheckForm", method = RequestMethod.GET)
	public String workDayCheck_workDayCheckForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();

		MybatisWorkDayCheckDao service = MybatisWorkDayCheckDao.getInstance();
		String empno = (String) session.getAttribute("memEmpno");
		/* empno="1"; */
		List<WorkDayCheckDataBean> list = service.getDate(Integer.parseInt(empno));
		String result = "";
		for (WorkDayCheckDataBean emp : list) {
			String mintime = emp.getWorkmin();
			String latetime = "09:01:00";
			SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");
			Date min_time = sf.parse(mintime);
			Date late_time = sf.parse(latetime);

			if (emp.getWorkmin() == null) {
			result = "결석";
			emp.setResult(result);
			} else if (emp.getWorkmax() != emp.getWorkmin() && min_time.getTime() >= late_time.getTime()) {
				result = "지각";
				emp.setResult(result);
			} else {
				result = "정상출근";
				emp.setResult(result);

			}
			if (emp.getWorkmax() == emp.getWorkmin()) {
				result = "조퇴";
				emp.setResult(result);

			}

		}
		
//		request.setAttribute("result", result);
		request.setAttribute("list", list);
		request.setAttribute("empno", empno);

		return "/view/workDayCheck/workDayCheckForm.jsp";
	}
}
