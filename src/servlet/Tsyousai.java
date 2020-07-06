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
 * Servlet implementation class Tsyousai
 */
@WebServlet("/Tsyousai")
public class Tsyousai extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tsyousai() {
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
		String tid=request.getParameter("tid");
		System.out.println(tid);
		db.dbOpen();
		ArrayList<String[]> ary = db.getTsyousai(tid);
		ArrayList<String[]> ary2= db.getTkanren(tid);
		db.dbClose();
		session.setAttribute("Tsyousai",ary);
		session.setAttribute("Tkanren",ary2);
		session.setAttribute("tid",tid);

		response.sendRedirect("jsp/Tsyousai.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
