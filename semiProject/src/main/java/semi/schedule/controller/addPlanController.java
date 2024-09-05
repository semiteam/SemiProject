package semi.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.schedule.model.service.ScheduleService;
import semi.schedule.model.vo.Schedule;
import semi.userBgi.model.service.userBgiService;
import semi.userBgi.model.vo.UserBgi;

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
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resouces/scheduleUpfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
		
			String sTitle = multiRequest.getParameter("plan_title");
			String sPlace = multiRequest.getParameter("choice");
		
			String sYear = multiRequest.getParameter("sDate").substring(11, 15);
			String sMonth = "";
			switch(multiRequest.getParameter("sDate").substring(4, 7)) {
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
			String sDay = multiRequest.getParameter("sDate").substring(8, 10);
			
			String eYear = multiRequest.getParameter("eDate").substring(11, 15);
			String eMonth = "";
			switch(multiRequest.getParameter("eDate").substring(4, 7)) {
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
			String eDay = multiRequest.getParameter("eDate").substring(8, 10);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date sSdate = null;
			Date sEdate = null;

			try {
			    sSdate = new Date(dateFormat.parse(sYear.trim() + "-" + sMonth.trim() + "-" + sDay.trim()).getTime());
			    sEdate = new Date(dateFormat.parse(eYear.trim() + "-" + eMonth.trim() + "-" + eDay.trim()).getTime());
			} catch (ParseException e) {
			    e.printStackTrace();
			}
			
			String sDescription = multiRequest.getParameter("explanation_e");
			int rangeNo = Integer.parseInt(multiRequest.getParameter("range")); // 공개 범위
			int bgiNo;
			if (!multiRequest.getParameter("img").equals("")) {
				bgiNo = Integer.parseInt(multiRequest.getParameter("img"));
			} else if (multiRequest.getOriginalFileName("userImg") != null) {
				UserBgi ub = new UserBgi(multiRequest.getOriginalFileName("userImg"), multiRequest.getFilesystemName("userImg"), "resouces/scheduleUpfiles/");
				
				new userBgiService().insertUserBgi(ub);
				
				bgiNo = new userBgiService().selectUserBgiNo(ub).getuBgiNo();
			} else {
				bgiNo = 1;
			}
			int mno = Integer.parseInt(multiRequest.getParameter("mno"));
			int howlong = Integer.parseInt(multiRequest.getParameter("howlong"));
			
			LocalDate today = LocalDate.now();
			LocalDate startLocalDate = ((java.sql.Date)sSdate).toLocalDate();
			String sStatus = "N";
			
			if (today.equals(startLocalDate)) {
				sStatus = "T";
			}
			
			Schedule sd = new Schedule(sTitle, sPlace, sSdate, sEdate, sDescription, rangeNo, bgiNo, sStatus, mno, howlong);
			
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
