package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class page
 */
@WebServlet("/page")
public class page extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public page() {
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
		String no=request.getParameter("no");
		String seni=request.getParameter("seni");
		System.out.println(no);
		session.setAttribute("page",no);
		if(seni.equals("1")) {
		response.sendRedirect("jsp/KAlltokusyuu.jsp");
		}
		else if(seni.equals("2")) {
			response.sendRedirect("jsp/denpyou.jsp");
		}
		else if(seni.equals("3")) {
			response.sendRedirect("jsp/TAlltokusyuu.jsp");
		}
		System.out.println(no);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
