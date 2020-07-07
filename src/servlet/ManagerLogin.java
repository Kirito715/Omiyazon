package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DBClass;

/**
 * Servlet implementation class ManagerLogin
 */
@WebServlet("/ManagerLogin")
public class ManagerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("inputId");
		String pass = request.getParameter("inputPass");

		DBClass db = new DBClass();
		db.dbOpen();
		if(db.mngLogin(id,pass)) {
			response.sendRedirect("ManagerTop");
		}
		else {
			System.out.println("ログイン失敗");
			response.sendRedirect("jsp/managerLogin.jsp");
		}
		db.dbClose();
	}
}


