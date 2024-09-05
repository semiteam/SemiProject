package semi.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.schedule.model.service.ScheduleService;
import semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class UpdateScheduleController
 */
@WebServlet("/UpdateSchedule.sd")
public class UpdateScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		int sno = Integer.parseInt(request.getParameter("sno"));
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		Date startDate = null;
		Date endDate = null;
		int howlong = 0;
		
		try {
            String[] dates = date.split(" ~ ");
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
            
            java.util.Date utilStartDate = dateFormat.parse(dates[0].trim());
            java.util.Date utilEndDate = dateFormat.parse(dates[1].trim());

            startDate = new Date(utilStartDate.getTime());
            endDate = new Date(utilEndDate.getTime());
            long differenceInMillis = endDate.getTime() - startDate.getTime();
            howlong = (int)differenceInMillis / (1000 * 60 * 60 * 24) + 1;            
        } catch (ParseException e) {
            e.printStackTrace();
        }
		
		Schedule sd = new Schedule(sno, title, startDate, endDate, mno, howlong);
		
		int reult = new ScheduleService().updateSchedule(sd);
		
		response.getWriter().print(reult);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
