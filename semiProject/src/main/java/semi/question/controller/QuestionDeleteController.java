package semi.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.question.model.service.QuestionService;

/**
 * Servlet implementation class QuestionDeleteController
 */
@WebServlet("/delete.sc")
public class QuestionDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		int result = new QuestionService().deleteQuestion(qNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문의 삭제 성공");
			response.sendRedirect(request.getContextPath()+"/GoServiceCenter.sc");
			
		}else {
			session.setAttribute("alertMsg", "문의 삭제 실패");
			response.sendRedirect(request.getContextPath()+"/enrollForm.sc");
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
