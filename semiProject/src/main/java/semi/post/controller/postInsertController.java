package semi.post.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import semi.member.model.vo.Member;
import semi.post.model.service.PostService;

/**
 * Servlet implementation class postInsertController
 */
@WebServlet("/insert.po")

public class postInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postInsertController() {
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
		request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인된 사용자 정보 가져오기
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");
        System.out.println("gd");

        if (loginUser == null) {
            // 로그인되지 않은 경우, 로그인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/loginPage.jsp");
            return;
        }

        // 로그인된 사용자의 회원 번호 가져오기
        int mno = loginUser.getmNo();

        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        

        // 게시글 등록 서비스 호출
        int result = new PostService().insertPost(mno, title, content);

        if (result > 0) {
            // 게시글 등록 성공 시 게시글 목록 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/list.po?cpage=1");
            request.setAttribute(title, "title");
            request.setAttribute(content, "content");
        } else {
            // 게시글 등록 실패 시 에러 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}


