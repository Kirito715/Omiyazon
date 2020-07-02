package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DBClass;

/**
 * Servlet implementation class TopPage
 */
@WebServlet("/TopPage")
public class TopPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session=request.getSession();

		DBClass db = new DBClass();
		String[][] color =new String[10][2];
		int userId=Integer.parseInt(request.getParameter("userId"));
		String TPass = request.getParameter("TPass");
		String jbutton = request.getParameter("jbutton");
//		String Pass1 = request.getParameter("rPass");

		db.dbOpen();

		ArrayList<String[]>  getTokusyuData = db. getTokusyuData(TPass);
		ArrayList<String[]>  getJanruData = db. getJanruData(jbutton);
		ArrayList<String[]> aryRanking5 = db.getRankingData(null);

		//日本地図の色設定
		ArrayList<String> region =db.getComplete(userId);
		//初期カラー
		for(int i=0; i < 10 ; i++) {
			color[i][0]="#BDBDBD";
			color[i][1]="#E6E6E6";
		}

		if(region!=null) {
		for(int i=0;i<region.size();i++) {
			color[Integer.parseInt(region.get(i))][0]="#FF0000";
			color[Integer.parseInt(region.get(i))][1]="#FA5858";
		 }
		}

		session.setAttribute("reqTokusyuPass", getTokusyuData);
		session.setAttribute("reqJanruname", getJanruData);
		session.setAttribute("reqRanking", aryRanking5);
		session.setAttribute("color", color);

		db.dbClose();

		response.sendRedirect("jsp/TopPage.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
