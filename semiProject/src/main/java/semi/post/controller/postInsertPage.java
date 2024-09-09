package semi.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.common.model.vo.PageInfo;
import semi.post.model.service.PostService;
import semi.post.model.vo.Post;

/**
 * Servlet implementation class postInsertPage
 */
@WebServlet("/insertPage.po")
public class postInsertPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public postInsertPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");

		if (session.getAttribute("loginUser") == null && session.getAttribute("loginAdmin") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");

			response.sendRedirect(request.getContextPath());
		} else {
			request.getRequestDispatcher("views/post/postWrite.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
