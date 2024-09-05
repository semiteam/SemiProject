package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/deleteMember.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 로그인된 사용자 정보 가져오기
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 로그아웃 또는 탈퇴 처리 실패 시 로그인 페이지로 리다이렉트
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.me");
            return;
        }

        // 로그인된 사용자 ID로 탈퇴 처리
        String userId = loginUser.getmId();
        MemberService memberService = new MemberService();
        int result = memberService.deleteMember(userId);

        if (result > 0) {
            // 탈퇴 성공 시 세션 무효화 및 로그아웃 처리 후 탈퇴 완료 페이지로 리다이렉트
            session.invalidate(); // 세션 무효화
            response.sendRedirect(request.getContextPath());
        } else {
            // 탈퇴 실패 시 에러 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
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
