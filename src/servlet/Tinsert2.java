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
 * Servlet implementation class Tinsert2
 */
@WebServlet("/Tinsert2")
public class Tinsert2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tinsert2() {
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
		String n1=request.getParameter("title");
		String n2=request.getParameter("honbun");
		String n3=request.getParameter("fdate");
		String n4=request.getParameter("edate");
		String n5=request.getParameter("pasu");
		String[] sid=request.getParameterValues("itemid");


		DBClass db = new DBClass();
		db.dbOpen();
		db.insertT(n1,n2,n3,n4,n5);
		if(sid!=null) {
		for(int i=0;i<sid.length;i++){
			db.insertkanren(sid[i]);
		}
		}
		db.dbClose();
		response.sendRedirect("KAlltokusyuu");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
