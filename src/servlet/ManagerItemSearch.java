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
 * Servlet implementation class ManagerItemSearch
 */
@WebServlet("/ManagerItemSearch")
public class ManagerItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerItemSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String text = request.getParameter("itemName");
		if(text == null) {
			text = "";
		}
		String regionId = request.getParameter("selectRegion");
		String prefId = request.getParameter("selectPref");
		String genre = request.getParameter("selectGenre");
		String itemState = request.getParameter("itemState");

		System.out.println(itemState);


		DBClass db = new DBClass();
		db.dbOpen();
		ArrayList<String[]>searchResult = db.getMngItemList(text,regionId,prefId,genre,itemState);
		db.dbClose();


		String[] searchCondition = {text,regionId,prefId,genre,itemState};

		session.setAttribute("mSearchResult", searchResult);
		session.setAttribute("mSearchCondition", searchCondition);

		response.sendRedirect("jsp/managerTop.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
