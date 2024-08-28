package semi.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.common.model.vo.PageInfo;
import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;
import semi.question.model.service.QuestionService;
import semi.question.model.vo.Question;
import semi.question.model.vo.Reply;

/**
 * Servlet implementation class GoServiceCenterController
 */
@WebServlet("/GoServiceCenter.sc")
public class GoServiceCenterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoServiceCenterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new QuestionService().selectQuestionCount();
		
		 if (request.getParameter("qCpage") != null) {
		        currentPage = Integer.parseInt(request.getParameter("qCpage"));
		    } else {
		        currentPage = 1;
		    }
		
		pageLimit = 10;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage -1 )/pageLimit * pageLimit+1 ;
		
		endPage = startPage + pageLimit  - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Question> list = new QuestionService().selectQuestion(pi);
		
		request.setAttribute("pi",pi);
		request.setAttribute("list", list);
		
		
		
		
		request.getRequestDispatcher("views/question/questionListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
