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
	      	
		   // 1. 요청에 대한 인코딩 설정
        request.setCharacterEncoding("utf-8");

        // 2. 클라이언트로부터 받은 파라미터들
        String mId = request.getParameter("userId");
        String mNickname = request.getParameter("newNickName");
        String mPwd = request.getParameter("newPwd");
        String mEmail = request.getParameter("newEmail");
        String mPhone = request.getParameter("newPhone");

        // 주소 관련 필드 수집 (우편번호, 기본 주소, 상세 주소)
        String postcode = request.getParameter("postcode");
        String address = request.getParameter("address");
        String detailAddress = request.getParameter("detailAddress");

        // 주소 필드들을 합쳐서 하나의 주소로 만듬
        String fullAddress = (postcode != null ? postcode + " " : "") + (address != null ? address + " " : "") + (detailAddress != null ? detailAddress : "");

        // 3. 세션에서 로그인된 사용자 정보 가져오기
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 로그인되지 않은 상태라면 로그인 페이지로 리다이렉트
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/login.me");
            return;
        }

        // 4. 입력받은 값으로 업데이트할 회원 객체 생성
        Member updatedMember = new Member(mId, mNickname, mPwd, mPhone, mEmail, fullAddress);

        // 5. 서비스 호출하여 회원 정보 업데이트
        MemberService memberService = new MemberService();
        Member updateMem = memberService.updateMember(updatedMember);

        // 6. 응답을 위한 ContentType 및 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 7. 자바스크립트로 응답 처리
        PrintWriter out = response.getWriter();

        if (updateMem == null) {
            // 업데이트 실패 시
            out.println("<script>");
            out.println("alert('업데이트에 실패했습니다.');");
            out.println("location.href='" + request.getContextPath() + "/myPage.me';");
            out.println("</script>");
        } else {
            // 업데이트 성공 시
            session.setAttribute("loginUser", updateMem);
            out.println("<script>");
            out.println("alert('업데이트가 성공적으로 완료되었습니다.');");
            out.println("location.href='" + request.getContextPath() + "/myPage.me';");
            out.println("</script>");
        }
    }
  
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터 인코딩 설정
	    request.setCharacterEncoding("UTF-8");

	    // 폼에서 전송된 데이터 받아오기
	    String postcode = request.getParameter("postcode");
	    String basicAddress = request.getParameter("address");  // 기본 주소 받아오기
	    String detailAddress = request.getParameter("detailAddress");  // 상세 주소 받아오기

	    // 로그로 각 값을 출력해 확인
	    System.out.println("우편번호: " + postcode);
	    System.out.println("기본 주소: " + basicAddress);
	    System.out.println("상세 주소: " + detailAddress);

	    // 세션에서 현재 로그인한 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        response.sendRedirect(request.getContextPath() + "/login.me");
	        return;
	    }

	    // 새로운 주소 데이터를 가지고 회원 정보 업데이트
	    loginUser.setPostalCode(postcode);
	    loginUser.setBasicAddress(basicAddress);
	    loginUser.setDetailedAddress(detailAddress);

	    // 서비스 호출하여 DB 업데이트
	    MemberService memberService = new MemberService();
	    int result = memberService.updateAddress(loginUser);

	    if (result > 0) {
	        // 성공적으로 업데이트 되면 다시 마이페이지로 리다이렉트
	        session.setAttribute("loginUser", loginUser);
	        response.sendRedirect(request.getContextPath() + "/myPage.me");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	    }
    }

}
