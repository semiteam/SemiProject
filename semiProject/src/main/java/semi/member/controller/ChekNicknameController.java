package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.model.service.MemberService;

/**
 * Servlet implementation class ChekNicknameController
 */
@WebServlet("/checkNickname.me")
public class ChekNicknameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChekNicknameController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");

        int result = new MemberService().checkNickname(nickname);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (result > 0) { // 중복된 닉네임
            response.getWriter().write("{\"isDuplicate\": true}");
        } else { // 사용 가능한 닉네임
            response.getWriter().write("{\"isDuplicate\": false}");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    }
	}


