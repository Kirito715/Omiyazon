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
 * Servlet implementation class kounyu
 */
@WebServlet("/kounyu")
public class kounyu extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kounyu() {
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
		String uid=(String)session.getAttribute("userId");
		String action=request.getParameter("action");
		String c=request.getParameter("count");
		String sid=request.getParameter("sid");
		String num=request.getParameter("num");
		DBClass db = new DBClass();
		db.dbOpen();

		if(action.equals("del")) {
			db.deletecart(sid,uid);
			ArrayList<String[]> ary = db.getcart(uid);
			session.setAttribute("cart",ary);

		}

		else if(action.equals("upd")) {
			db.updcart(num, uid, sid);
			ArrayList<String[]> ary = db.getcart(uid);
			session.setAttribute("cart",ary);

		}
		db.dbClose();
		response.sendRedirect("jsp/cart.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String uid=(String)session.getAttribute("userId");

		System.out.println("セッション取得後uid : "+uid);
		DBClass db=new DBClass();
		db.dbOpen();
		ArrayList<String[]> ary = db.getUser(uid);
		System.out.println("getuser後uid : "+uid);
		ArrayList<String[]> ary2 = db.getcart(uid);
		db.dbClose();
		session.setAttribute("user",ary);
		session.setAttribute("cart",ary2);
		session.setAttribute("uid",uid);
		response.sendRedirect("jsp/kounyuu.jsp");

	}

}
