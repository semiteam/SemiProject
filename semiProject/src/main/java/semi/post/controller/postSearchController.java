package semi.post.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import semi.post.model.service.PostService;
import semi.post.model.vo.Post;

/**
 * Servlet implementation class postSearchController
 */
@WebServlet("/searchPosts.do")
public class postSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");

        // 검색 결과를 가져오는 서비스 호출
        ArrayList<Post> searchResults = new PostService().searchPosts(keyword);

        	
        // JSON 형태로 결과 반환
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JSONArray jsonArray = new JSONArray();

        JSONObject pageInfo = new JSONObject();
                for (Post post : searchResults) {
        	JSONObject jsonPost = new JSONObject();
            jsonPost.put("mNo", post.getmNo());
            jsonPost.put("postNo", post.getPostNo());
            jsonPost.put("postTitle", post.getPostTitle() != null ? post.getPostTitle() : "제목 없음");
            jsonPost.put("postContent", post.getPostContent() != null ? post.getPostContent() : "");
            jsonPost.put("postCount", post.getPostCount());
            jsonPost.put("postRecommend", post.getPostRecommend());
            jsonPost.put("postDate", post.getPostDate() != null ? post.getPostDate().toString() : "");
            jsonPost.put("mId", post.getmId() != null ? post.getmId() : "작성자 없음");

            


            jsonArray.add(jsonPost);  // JSONArray에 JSONObject 추가
        }
        System.out.println("JSON Array: " + jsonArray.toJSONString());
        out.print(jsonArray.toJSONString()); // JSONArray를 문자열로 변환하여 출력
        
        out.flush();
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
