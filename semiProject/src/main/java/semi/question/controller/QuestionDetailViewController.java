package semi.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.question.model.service.QuestionService;
import semi.question.model.vo.Question;

/**
 * Servlet implementation class QuestionDetailViewController
 */
@WebServlet("/detail.sc")
public class QuestionDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("qNo")) ;
		
		Question q = new QuestionService().selectQuestion(qNo);
		
		if(q == null) {
			
			request.getSession().setAttribute("alertMsg", "글 불러오기가 실패했습니다");
			response.sendRedirect(request.getContextPath()+"/questionListView.jsp");
			
		}else {
			
			request.setAttribute("q", q);
			request.getRequestDispatcher("views/question/questionDetailView.jsp").forward(request, response);
			
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
