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
 * Servlet implementation class ItemSearch
 */
@WebServlet("/ItemSearch")
public class ItemSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String userId = (String)session.getAttribute("userId");

		String text = request.getParameter("searchtext");
		if(text == null) {
			text = "";
		}
		String regionId = request.getParameter("selectRegion");
		if(regionId== null) {
			regionId = "0";
		}
		String prefId = request.getParameter("selectPref");
		if(prefId == null) {
			prefId = "0";
		}
		String[] genre = request.getParameterValues("genre");
		if(genre == null) {
			genre = new String[1];
			genre[0] = "0";
		}

		System.out.println(text);
		System.out.println(regionId);
		System.out.println(prefId);
		for (int i = 0; i < genre.length; i++){
		System.out.println(genre[i]);
		}

		DBClass db = new DBClass();
		db.dbOpen();
		ArrayList<String[]>searchResult = db.getItemList(text,regionId,prefId,genre,userId);
		db.dbClose();

		String[] genrecon = {"0","0","0","0","0","0","0","0"};
		for (int i = 0; i < genre.length; i++){
			if(!genre[i].equals("0")) {
				genrecon[Integer.parseInt(genre[i])-1] = genre[i];
			}
		}

		for (int i = 0; i < genrecon.length; i++){
			System.out.println(genrecon[i]);
			}


		String[] searchCondition = {text,regionId,prefId,genrecon[0],genrecon[1],genrecon[2],genrecon[3],genrecon[4],genrecon[5],genrecon[6],genrecon[7]};

		session.setAttribute("searchResult", searchResult);
		session.setAttribute("searchCondition", searchCondition);

		response.sendRedirect("jsp/user/itemList.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
