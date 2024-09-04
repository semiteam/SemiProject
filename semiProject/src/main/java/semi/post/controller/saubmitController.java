package semi.post.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import semi.post.model.service.CommentService;  // CommentService import
import semi.post.model.vo.Comment;  // Comment 클래스 import

/**
 * Servlet implementation class saubmitController
 */
@WebServlet("/submitComment")
public class saubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public saubmitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트에서 받은 데이터
        String requestData = request.getReader().lines().collect(Collectors.joining());

        // JSON 파싱
        JSONParser parser = new JSONParser();
        JSONObject jsonRequest = null;
        try {
            jsonRequest = (JSONObject) parser.parse(requestData);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // JSON 데이터 처리
        String content = (String) jsonRequest.get("content");
        long postId = (long) jsonRequest.get("postId");

        // 댓글을 저장하는 서비스 호출
        CommentService commentService = new CommentService();
        Comment newComment = commentService.saveComment((int) postId, content);

        // 응답 생성
        JSONObject jsonResponse = new JSONObject();
        if (newComment != null) {
            jsonResponse.put("success", true);
            JSONObject commentData = new JSONObject();
            commentData.put("author", newComment.getAuthor());
            commentData.put("date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(newComment.getDate()));
            commentData.put("content", newComment.getContent());
            jsonResponse.put("comment", commentData);
        } else {
            jsonResponse.put("success", false);
        }

        // 응답 전송
        response.setContentType("application/json");
        response.getWriter().print(jsonResponse.toString());
    }
	}


