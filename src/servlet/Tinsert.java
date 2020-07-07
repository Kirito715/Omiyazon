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
 * Servlet implementation class Tinsert
 */
@WebServlet("/Tinsert")
public class Tinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tinsert() {
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
		String[] sid=request.getParameterValues("itemid");
		ArrayList<String[]> kanren = new ArrayList<String[]>();
		DBClass db = new DBClass();
		db.dbOpen();
		if(sid!=null) {

		for(int i=0;i<sid.length;i++) {
			ArrayList<String[]> syouhin = db.getsyouhin(sid[i]);
			String[] strData = new String[7];
        	strData[0] =syouhin.get(i)[0];
        	strData[1] =syouhin.get(i)[1];
        	kanren.add(strData);
			}
		}

		db.dbClose();
		session.setAttribute("kanren", kanren);
		session.setAttribute("sid", sid);
		response.sendRedirect("jsp/Tinsert.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
