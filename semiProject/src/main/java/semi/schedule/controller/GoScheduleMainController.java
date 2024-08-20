package semi.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.schedule.model.service.ScheduleService;
import semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class GoScheduleMainController
 */
@WebServlet("/GoScheduleMain.sd")
public class GoScheduleMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoScheduleMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginUser") == null && session.getAttribute("loginAdmin") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			
			response.sendRedirect(request.getContextPath());
		} else {
			int mno = Integer.parseInt(request.getParameter("mno"));
			
			ArrayList<Schedule> list = new ScheduleService().selectSchedule(mno);
			
			if (list.isEmpty()) {
				request.getRequestDispatcher("views/schedule/plan_X.jsp").forward(request, response);
			} else {
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/schedule/plan_O.jsp").forward(request, response);
			}
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
