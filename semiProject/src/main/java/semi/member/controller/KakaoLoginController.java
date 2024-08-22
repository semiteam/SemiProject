package semi.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class KakaoLoginController
 */
@WebServlet("/kakoLogin.ad")
public class KakaoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginController() {
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
	
		
		BufferedReader reader = request.getReader();
	    StringBuilder sb = new StringBuilder();
	    String line;
	    while ((line = reader.readLine()) != null) {
	        sb.append(line);
	    }
	    String jsonString = sb.toString();

	    JsonParser parser = new JsonParser();
	    JsonElement element = parser.parse(jsonString);

	    JsonObject jsonObject = element.getAsJsonObject();
	    String kakaoId = jsonObject.get("kakaoId").getAsString();
	    String nickname = jsonObject.get("nickname").getAsString();
	    String email = jsonObject.get("email").getAsString();

	    MemberService memberService = new MemberService();
	    Member loginUser = memberService.loginWithKakao(kakaoId, nickname, email);

	    HttpSession session = request.getSession();

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    if (loginUser != null) {
	        session.setAttribute("loginUser", loginUser);
	        session.setAttribute("alertMsg", loginUser.getmNickname() + "님의 방문을 환영합니다");
	        response.getWriter().write("{\"success\": true}");
	    } else {
	        session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
	        response.getWriter().write("{\"success\": false, \"message\": \"로그인에 실패했습니다.\"}");
	    }
	}
}

