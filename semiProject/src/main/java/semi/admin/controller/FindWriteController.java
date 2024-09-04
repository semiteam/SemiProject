package semi.admin.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.admin.model.service.AdminService;
import semi.post.model.vo.Post;
import semi.question.model.vo.Question;

/**
 * Servlet implementation class FindWriteController
 */
@WebServlet("/findWrite.ad")
public class FindWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String str = request.getParameter("value");
		String value = "%" + str + "%";
		
		ArrayList<Post> pList = new AdminService().findPost(value);
		ArrayList<Question> qList = new AdminService().findQuestion(value);
		
		ArrayList<Object> combiList = new ArrayList<Object>();
		
		combiList.add(pList);
		combiList.add(qList);

		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(combiList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
