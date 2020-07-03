package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DBClass;

/**
 * Servlet implementation class Tupdate
 */
@WebServlet("/Tupdate")
public class Tupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tupdate() {
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
		String txt=request.getParameter("txt");
		String txt2=request.getParameter("txt2");
		String tid=request.getParameter("tid");
		String button=request.getParameter("button");
		System.out.println(tid);
		String txt3=txt2+"【追記】"+txt;
		DBClass db = new DBClass();
		db.dbOpen();
		if(button.equals("1")) db.updT2(tid);
		else if(button.equals("2")) db.updT3(tid);
		else {if(!txt.equals("null"))
			db.updT(tid,txt3);
		}
		db.dbClose();
		System.out.println(txt3);
		response.sendRedirect("jsp/KAlltokusyuu.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
