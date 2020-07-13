package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DetailBean;
import common.DBClass;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action =request.getParameter("action");
		Integer itemid =Integer.parseInt(request.getParameter("itemid"));
		Integer userid  =Integer.parseInt(request.getParameter("userid"));

		DBClass db=new DBClass();
		db.dbOpen();

		if(action.equals("create")) {
			System.out.println("create");
			db.createFavorite(itemid,userid);
		}else if(action.equals("delete")) {
			System.out.println("delete");
			db.deleteFavorite(itemid,userid);
		}
		HttpSession session = request.getSession();
		DetailBean bean = (DetailBean)session.getAttribute("DetaillBean");
		bean = db.judgeFavorite(bean);
		session.setAttribute("DetaillBean",bean);
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
