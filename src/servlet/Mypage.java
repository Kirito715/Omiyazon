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
		String uid=(String)session.getAttribute("userId");
		db.dbOpen();
		ArrayList<String[]> a = db.getuser(uid);
		ArrayList<String[]> b = db.getrecode(uid);
		ArrayList<String[]> c = db.getbook(uid);
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
