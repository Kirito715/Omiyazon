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
 * Servlet implementation class recode2
 */
@WebServlet("/recode2")
public class recode2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public recode2() {
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
		String uid=request.getParameter("uid");
		String sid=request.getParameter("sid");
		String did=request.getParameter("did");
//		String button=request.getParameter("button");
		DBClass db = new DBClass();
		session.setAttribute("sid", sid);
		session.setAttribute("uid", uid);
		db.dbOpen();
//		if(button.equals("1")) {
		db.deleterecode(sid,did);
		ArrayList<String[]> ary = db.getrecode(uid);
		session.setAttribute("myrecode", ary);
		response.sendRedirect("jsp/recode.jsp");
//		}
//		else if(button.equals("2")) {
//
//
//		}
		db.dbClose();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
