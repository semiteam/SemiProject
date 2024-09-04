package semi.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.post.model.service.PostService;

/**
 * Servlet implementation class postUpdateController
 */
@WebServlet("/update.po")
public class postUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		request.setCharacterEncoding("utf-8");

	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    String pnoString = request.getParameter("pno");

	    if (pnoString == null || pnoString.isEmpty()) {
	        // pno가 null이거나 빈 문자열일 경우 에러 처리
	        response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	        return;
	    }

	    int pno = Integer.parseInt(pnoString);

	    int result = new PostService().updatePost(title, content, pno);

	    if(result > 0) {
	        // 수정이 성공했을 경우
	        response.sendRedirect(request.getContextPath() + "/list.po?cpage=1");
	    } else {
	        // 수정이 실패했을 경우 (필요 시 에러 처리 추가)
	        response.sendRedirect(request.getContextPath() + "/postDetail.po?pno=" + pno);
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
