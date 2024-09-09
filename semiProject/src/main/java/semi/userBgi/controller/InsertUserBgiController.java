package semi.userBgi.controller;

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

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyFileRenamePolicy;
import semi.schedule.model.service.ScheduleService;
import semi.schedule.model.vo.Schedule;
import semi.userBgi.model.service.userBgiService;
import semi.userBgi.model.vo.UserBgi;

/**
 * Servlet implementation class InsertUserBgiController
 */
@WebServlet("/InsertUserBgi.ub")
public class InsertUserBgiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserBgiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resouces/scheduleUpfiles/");
			System.out.println(savePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			UserBgi ub = new UserBgi(multiRequest.getOriginalFileName("userImg"), multiRequest.getFilesystemName("userImg"), "/resouces/scheduleUpfiles/");
			
			int result = new userBgiService().insertUserBgi(ub);
			
			int bgiNo = new userBgiService().selectUserBgiNo(ub).getuBgiNo();
			
			response.getWriter().print(result * bgiNo);
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
