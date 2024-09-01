package semi.detailSchedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.detailSchedule.model.service.DetailScheduleService;
import semi.detailSchedule.model.vo.DetailSchedule;

/**
 * Servlet implementation class InsertDetailScheduleController
 */
@WebServlet("/InsertDetail.d")
public class InsertDetailScheduleController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDetailScheduleController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String dPlace = request.getParameter("choice");
        String dDateStr = request.getParameter("adit_date");
        String dStartH = request.getParameter("startHour");
        String dStartM = request.getParameter("startMinute");
        String dEndH = request.getParameter("endHour");
        String dEndM = request.getParameter("endMinute");
        String dElse = request.getParameter("else");
        int mno = Integer.parseInt(request.getParameter("mno"));
        int sno = Integer.parseInt(request.getParameter("sno"));
        int howlong = Integer.parseInt(request.getParameter("howlong"));

        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Timestamp dStime = null;
        Timestamp dEtime = null;
        Date dDate = null;

        try {
        	dStime = new Timestamp(dateTimeFormat.parse(dDateStr + " " + dStartH + ":" + dStartM).getTime());
        	dEtime = new Timestamp(dateTimeFormat.parse(dDateStr + " " + dEndH + ":" + dEndM).getTime());

            java.util.Date parsedDate = new SimpleDateFormat("yyyy-MM-dd").parse(dDateStr);
            dDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        DetailSchedule ds = new DetailSchedule(dPlace, dStime, dEtime, dElse, dDate, mno, sno);

        int result = new DetailScheduleService().insertDetail(ds);

        String alert;
        if (result > 0) {
            alert = "세부 일정 추가에 성공하였습니다.";
        } else {
            alert = "세부 일정 추가에 실패하였습니다.";
        }

        response.sendRedirect(request.getContextPath() + "/GoAddDetail.d?mno=" + mno + "&sno=" + sno + "&howlong=" + howlong);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
