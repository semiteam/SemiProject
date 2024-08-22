package semi.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.schedule.model.service.ScheduleService;
import semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class addPlanController
 */
@WebServlet("/addPlan.sd")
public class addPlanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addPlanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String sTitle = request.getParameter("plan_title");
		String sPlace = request.getParameter("choice");
	
		String sYear = request.getParameter("sDate").substring(11, 15);
		String sMonth = "";
		switch(request.getParameter("sDate").substring(4, 7)) {
			case "Jan":
				sMonth = "01";
				break;
			case "Feb":
				sMonth = "02";
				break;
			case "Mar":
				sMonth = "03";
				break;
			case "Apr":
				sMonth = "04";
				break;
			case "May":
				sMonth = "05";
				break;
			case "Jun":
				sMonth = "06";
				break;
			case "Jul":
				sMonth = "07";
				break;
			case "Aug":
				sMonth = "08";
				break;
			case "Sep":
				sMonth = "09";
				break;
			case "Oct":
				sMonth = "10";
				break;
			case "Nov":
				sMonth = "11";
				break;
			case "Dec":
				sMonth = "12";
				break;
		}
		String sDay = request.getParameter("sDate").substring(8, 10);
		
		String eYear = request.getParameter("eDate").substring(11, 15);
		String eMonth = "";
		switch(request.getParameter("eDate").substring(4, 7)) {
			case "Jan":
				eMonth = "01";
				break;
			case "Feb":
				eMonth = "02";
				break;
			case "Mar":
				eMonth = "03";
				break;
			case "Apr":
				eMonth = "04";
				break;
			case "May":
				eMonth = "05";
				break;
			case "Jun":
				eMonth = "06";
				break;
			case "Jul":
				eMonth = "07";
				break;
			case "Aug":
				eMonth = "08";
				break;
			case "Sep":
				eMonth = "09";
				break;
			case "Oct":
				eMonth = "10";
				break;
			case "Nov":
				eMonth = "11";
				break;
			case "Dec":
				eMonth = "12";
				break;
		}
		String eDay = request.getParameter("eDate").substring(8, 10);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date sSdate = null;
		Date sEdate = null;

		try {
		    sSdate = new Date(dateFormat.parse(sYear.trim() + "-" + sMonth.trim() + "-" + sDay.trim()).getTime());
		    sEdate = new Date(dateFormat.parse(eYear.trim() + "-" + eMonth.trim() + "-" + eDay.trim()).getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		String sDescription = request.getParameter("explanation_e");
		int rangeNo = Integer.parseInt(request.getParameter("range")); // 공개 범위
		int bgiNo = Integer.parseInt(request.getParameter("img"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		Schedule sd = new Schedule(sTitle, sPlace, sSdate, sEdate, sDescription, rangeNo, bgiNo, mno);
		
		int result = new ScheduleService().insertSchedule(sd);
		
		String alertMsg;
		
		if (result > 0) {
			alertMsg = "성공적으로 일정을 등록하였습니다.";
			request.getSession().setAttribute("alertMsg", alertMsg);
			
			ArrayList<Schedule> list = new ScheduleService().selectSchedule(mno);
			
			request.setAttribute("list", list);
		} else {
			alertMsg = "일정 등록에 실패하였습니다.";
			request.getSession().setAttribute("alertMsg", alertMsg);
		}
		
		response.sendRedirect(request.getContextPath() + "/GoScheduleMain.sd?mno=" + mno);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
