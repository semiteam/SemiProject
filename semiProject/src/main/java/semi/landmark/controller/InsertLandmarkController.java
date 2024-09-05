package semi.landmark.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.landmark.model.service.LandmarkService;

/**
 * Servlet implementation class InsertLandmarkController
 */
@WebServlet("/InsertLandmark.l")
public class InsertLandmarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLandmarkController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String landmarkName = request.getParameter("landmarkName");
		String landmarkCity = request.getParameter("landmarkCity");
		String landmarkAddress = request.getParameter("landmarkAddress");
		
		int result = new LandmarkService().insertLandmark(landmarkCity, landmarkName, landmarkAddress);
		
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
