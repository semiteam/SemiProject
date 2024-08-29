package semi.detailSchedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.detailSchedule.model.service.DetailScheduleService;
import semi.detailSchedule.model.vo.DetailSchedule;

/**
 * Servlet implementation class EditDetailScheduleController
 */
@WebServlet("/EditDetail.d")
public class EditDetailScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDetailScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String dTime = request.getParameter("dTime");
		String dPlace = request.getParameter("dPlace");
		String dElse = request.getParameter("dElse");
		int dno = Integer.parseInt(request.getParameter("dno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		String dDate = request.getParameter("dDate");
		
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Timestamp dStime = null;
        Timestamp dEtime = null;

        try {
        	dStime = new Timestamp(dateTimeFormat.parse(dDate + " " + dTime.substring(0, 2) + ":" + dTime.substring(3, 5)).getTime());
        	dEtime = new Timestamp(dateTimeFormat.parse(dDate + " " + dTime.substring(11, 13) + ":" + dTime.substring(14, 16)).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        DetailSchedule ds = new DetailSchedule(dno, dPlace, dStime, dEtime, dElse, mno);
        
        int result = new DetailScheduleService().updateDetail(ds);
        
        response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
