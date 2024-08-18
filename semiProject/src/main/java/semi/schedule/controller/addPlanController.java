package semi.schedule.controller;

import java.io.IOException;
import java.sql.Date;

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
		String sTitle = request.getParameter("plan_title");
		String sPlace = request.getParameter("choice");
		
		String sYear = request.getParameter("sDate").substring(11, 15);
		String sMonth = "";
		switch(request.getParameter("sDate").substring(4, 7)) {
			case "jan":
				sMonth = "01";
				break;
			case "feb":
				sMonth = "02";
				break;
			case "mar":
				sMonth = "03";
				break;
			case "apr":
				sMonth = "04";
				break;
			case "may":
				sMonth = "05";
				break;
			case "jun":
				sMonth = "06";
				break;
			case "jul":
				sMonth = "07";
				break;
			case "aug":
				sMonth = "08";
				break;
			case "sep":
				sMonth = "09";
				break;
			case "oct":
				sMonth = "10";
				break;
			case "nov":
				sMonth = "11";
				break;
			case "dec":
				sMonth = "12";
				break;
		}
		String sDay = request.getParameter("sDate").substring(8, 10);
		String sSdate = "TO_DATE('"+ sYear + "-" + sMonth + "-" + sDay +"', 'YYYY-MM-DD')";
		
		String eYear = request.getParameter("eDate").substring(11, 15);
		String eMonth = "";
		switch(request.getParameter("eDate").substring(4, 7)) {
			case "jan":
				eMonth = "01";
				break;
			case "feb":
				eMonth = "02";
				break;
			case "mar":
				eMonth = "03";
				break;
			case "apr":
				eMonth = "04";
				break;
			case "may":
				eMonth = "05";
				break;
			case "jun":
				eMonth = "06";
				break;
			case "jul":
				eMonth = "07";
				break;
			case "aug":
				eMonth = "08";
				break;
			case "sep":
				eMonth = "09";
				break;
			case "oct":
				eMonth = "10";
				break;
			case "nov":
				eMonth = "11";
				break;
			case "dec":
				eMonth = "12";
				break;
	}
		String eDay = request.getParameter("eDate").substring(8, 10);
		String sEdate = "TO_DATE('"+ eYear + "-" + eMonth + "-" + eDay +"', 'YYYY-MM-DD')";
		
		String sDescription = request.getParameter("explanation_e");
		int rangeNo = Integer.parseInt(request.getParameter("range")); // 공개 범위
		int bgiNo = Integer.parseInt(request.getParameter("img"));
		
		Schedule sd = new Schedule(sTitle, sPlace, sSdate, sEdate, sDescription, rangeNo, bgiNo);
		
		int result = new ScheduleService().insertSchedule(sd);
		
		if (result )
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
