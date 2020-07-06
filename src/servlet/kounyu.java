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
		String uid=request.getParameter("uid");
		String button=request.getParameter("button");
		String c=request.getParameter("count");
		String sid=request.getParameter("sid");
		String num=request.getParameter("num");
		DBClass db = new DBClass();
		db.dbOpen();
		if(button.equals("1")) {
			db.deletecart(sid,uid);
			ArrayList<String[]> ary = db.getcart(uid);
			session.setAttribute("cart",ary);
			response.sendRedirect("jsp/cart.jsp");
		}
		//遷移先書き換え
		//受け取り名書き換え
		else if(button.equals("2")) {
			session.setAttribute("cart",uid);
			response.sendRedirect("jsp/cart.jsp");

			}
		else if(button.equals("3")) {
			db.updcart(num, uid, sid);
			ArrayList<String[]> ary = db.getcart(uid);
			session.setAttribute("cart",ary);
			response.sendRedirect("jsp/cart.jsp");
		}
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
