package semi.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.question.model.dao.QuestionDao;
import semi.question.model.service.QuestionService;
import semi.question.model.vo.Question;

/**
 * Servlet implementation class QuestionInsertController
 */
@WebServlet("/insert.sc")
public class QuestionInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String qTitle = request.getParameter("title");
		String qContent = request.getParameter("content");
		int qPwd = Integer.parseInt(request.getParameter("pwd"));
		
		
		Question q = new Question();
		
		q.setmNo(mNo);
		q.setQtitle(qTitle);
		q.setqContent(qContent);
		q.setqPwd(qPwd);
		
		
		
		int result = new QuestionService().insertQuestion(q);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문의가 등록되었습니다");
			response.sendRedirect(request.getContextPath()+"/GoServiceCenter.sc");
			
		}else {
			session.setAttribute("alertMsg", "문의 등록에 실패하였습니다");
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
