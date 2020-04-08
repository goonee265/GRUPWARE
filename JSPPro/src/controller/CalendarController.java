package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisCalendarDao;
import model.CalendarDataBean;

@SuppressWarnings("serial")
public class CalendarController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	}

	//calendar
	@RequestMapping(value = "calendar")
	public String calendar_calendar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String empno = (String) session.getAttribute("memEmpno");
		
		java.util.Calendar cal = java.util.Calendar.getInstance(); //Calendar객체 cal생성
		int currentYear = cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
		int currentMonth = cal.get(java.util.Calendar.MONTH);
		int currentDate = cal.get(java.util.Calendar.DATE);
		String Year = request.getParameter("year"); //나타내고자 하는 날짜
		String Month = request.getParameter("month");
		int year, month;
		if (Year == null && Month == null) { //처음 호출했을 때
			year = currentYear;
			month = currentMonth;
		} else { //나타내고자 하는 날짜를 숫자로 변환
			year = Integer.parseInt(Year);
			month = Integer.parseInt(Month);
			if (month < 0) {
				month = 11;
				year = year - 1;
			} //1월부터 12월까지 범위 지정.
			if (month > 11) {
				month = 0;
				year = year + 1;
			}
		}
		
		cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
		request.setAttribute("month", month);
		request.setAttribute("year", year);
		int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
		int br = 0; //7일마다 줄 바꾸기
	
		MybatisCalendarDao service = MybatisCalendarDao.getInstance();
		List<CalendarDataBean> list = service.getSchd(Integer.parseInt(empno));
		if (startDay<2) startDay = 3;
		if(endDay<startDay) endDay=startDay;
		
		
		
		request.setAttribute("Month", Month);
		request.setAttribute("Year", Year);
		request.setAttribute("currentYear", currentYear);
		request.setAttribute("currentMonth", currentMonth);
		request.setAttribute("currentDate", currentDate);
		request.setAttribute("startDay", startDay);
		request.setAttribute("br", br);
		request.setAttribute("endDay", endDay);
		request.setAttribute("list", list);
	/*	request.setAttribute("memoyear", memoyear);
		request.setAttribute("memomonth", memomonth);
		request.setAttribute("memoday", memoday);
		request.setAttribute("contents", contents);*/
		
		return "/view/calendar/calendar.jsp";
	}



	//calendarPro
	@RequestMapping(value = "calendarPro", method = RequestMethod.POST)
	public String calendar_calendarPro(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		CalendarDataBean article = new CalendarDataBean();
		
	/*	article.setCalendarNum(Integer.parseInt(request.getParameter("calendarNum")));*/
		article.setCalendarContents(request.getParameter("calendarContents"));
		article.setCalendarYear(Integer.parseInt(request.getParameter("calendarYear")));
		article.setCalendarMonth(Integer.parseInt(request.getParameter("calendarMonth")));
		article.setCalendarDay(Integer.parseInt(request.getParameter("calendarDay")));
		article.setEmpno(Integer.parseInt(request.getParameter("empno")));
		
		
		MybatisCalendarDao service=MybatisCalendarDao.getInstance();
		service.addSchd(article);

		request.setAttribute("article", article);
		
		return "/view/calendar/calendarPro.jsp";

	}
	
	//index
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String board_index(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setAttribute("hello", "안녕하세용~가리");
		return "/view/calendar/hello.jsp";
	}

		

}
