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
 * Servlet implementation class Mypage
 */
@WebServlet("/Mypage")
public class Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		DBClass db = new DBClass();
		String[][] color =new String[10][2];
		String uid=(String)session.getAttribute("userId");
		int userId = 0;
		db.dbOpen();
		ArrayList<String> region = new ArrayList<String>();
		//日本地図の色設定
				if(uid != null) {
					userId=Integer.parseInt(uid);
					region =db.getComplete(userId);
				}
				else {
					region = null;
				}
				//初期カラー
				for(int i=0; i < 10 ; i++) {
					color[i][0]="#BDBDBD";
					color[i][1]="#E6E6E6";
				}
				//地方カラー
				if(region!=null) {
				for(int i=0;i<region.size();i++) {
					color[Integer.parseInt(region.get(i))-1][0]="#93ff93";
					color[Integer.parseInt(region.get(i))-1][1]="#d8ffb2";
				 }
				}
		ArrayList<String[]> a = db.getuser(uid);
		ArrayList<String[]> b = db.getrecode(uid);
		ArrayList<String[]> c = db.getbook(uid);

		session.setAttribute("color", color);

		db.dbClose();
		session.setAttribute("myuser",a);
		session.setAttribute("myrecode",b);
		session.setAttribute("mybook",c);
		session.setAttribute("uid",uid);


		response.sendRedirect("jsp/Mypage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
