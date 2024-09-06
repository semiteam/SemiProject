package semi.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MyPageUpateController
 */
@WebServlet("/update.me")
public class MyPageUpateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      	
		
    }
  
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 폼에서 전송된 데이터 받아오기
        String mId = request.getParameter("userId");
        String mNickname = request.getParameter("newNickName");
        String mPwd = request.getParameter("newPwd");
        String mEmail = request.getParameter("newEmail");
        String mPhone = request.getParameter("newPhone");

        // 주소 관련 데이터 받아오기
        String postcode = request.getParameter("postcode");
        String basicAddress = request.getParameter("address");
        String detailAddress = request.getParameter("detailAddress");

        // 주소 필드를 합쳐서 fullAddress 생성
        String fullAddress = (postcode != null ? postcode + " " : "") + 
                             (basicAddress != null ? basicAddress + " " : "") + 
                             (detailAddress != null ? detailAddress : "");

        // 세션에서 현재 로그인한 사용자 정보를 가져오기
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 로그인한 사용자가 없으면 로그인 페이지로 리다이렉트
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.me");
            return;
        }

        // 새로운 정보로 회원 객체를 업데이트
        loginUser.setmNickname(mNickname);
        loginUser.setmPwd(mPwd);
        loginUser.setmPhone(mPhone);
        loginUser.setmEmail(mEmail);
        loginUser.setPostalCode(postcode);
        loginUser.setBasicAddress(basicAddress);
        loginUser.setDetailedAddress(detailAddress);

        // 회원 정보 업데이트 서비스 호출
        MemberService memberService = new MemberService();
        int result = memberService.updateMember(loginUser);

        // 응답을 위한 ContentType 및 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // 업데이트 결과 처리
        if (result > 0) {
            // 업데이트 성공 시 세션에 새로 업데이트된 정보를 반영
            session.setAttribute("loginUser", loginUser);
            out.println("<script>");
            out.println("alert('정보가 성공적으로 업데이트되었습니다.');");
            out.println("location.href='" + request.getContextPath() + "/GoMyPage.me';");
            out.println("</script>");
        } else {
            // 업데이트 실패 시
            out.println("<script>");
            out.println("alert('정보 업데이트에 실패했습니다.');");
            out.println("location.href='" + request.getContextPath() + "/GoMyPage.me';");
            out.println("</script>");
        }
    }
	    

}
