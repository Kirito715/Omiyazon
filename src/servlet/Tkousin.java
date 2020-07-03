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
 * Servlet implementation class Tkousin
 */
@WebServlet("/Tkousin")
public class Tkousin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tkousin() {
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
		String combo=request.getParameter("combo");
		String txt=request.getParameter("txt");
		String seni=request.getParameter("seni");
		System.out.println(combo);
		System.out.println(txt);
		DBClass db = new DBClass();
		db.dbOpen();
		ArrayList<String[]> ary = db.getTAll2(combo,txt);
		db.dbClose();
		session.setAttribute("tokusyuu", ary);
		if(seni.equals("1")) {
			response.sendRedirect("jsp/KAlltokusyuu.jsp");
		}
		else if(seni.equals("3")) {
			response.sendRedirect("jsp/TAlltokusyuu.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
