package semi.detailSchedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.detailSchedule.model.service.DetailScheduleService;
import semi.detailSchedule.model.vo.DetailSchedule;
import semi.schedule.model.service.ScheduleService;
import semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class GoAddDetailController
 */
@WebServlet("/GoAdminDetail.ad")
public class GoAdminDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoAdminDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int mno = Integer.parseInt(request.getParameter("mno"));
		int sno = Integer.parseInt(request.getParameter("sno"));
		int howlong = Integer.parseInt(request.getParameter("howlong"));
		
		if (session.getAttribute("loginUser") == null && session.getAttribute("loginAdmin") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			
			response.sendRedirect(request.getContextPath());
		} else {
			ArrayList<DetailSchedule> list = new DetailScheduleService().selectDetailSchedule(mno, sno);
			ArrayList<Schedule> days = new ScheduleService().selectDays(mno, sno);
			
			request.setAttribute("list", list);
			request.setAttribute("days", days);
			request.setAttribute("mno", mno);
			request.setAttribute("sno", sno);
			request.setAttribute("howlong", howlong);
			request.getRequestDispatcher("views/detailSchedule/addDetailAdmin.jsp").forward(request, response);
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
