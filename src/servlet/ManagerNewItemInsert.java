package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DBClass;

/**
 * Servlet implementation class ManagerNewItemInsert
 */
@WebServlet("/ManagerNewItemInsert")
public class ManagerNewItemInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerNewItemInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		DBClass db = new DBClass();
		db.dbOpen();

		String name = request.getParameter("name");
		String sname = request.getParameter("sname");
		String price = request.getParameter("price");
		String num = request.getParameter("num");
		String genre = request.getParameter("selectGenre");
		String prefId = request.getParameter("selectPref");
		String summary = request.getParameter("summary");
		String pic1 = request.getParameter("pic1");
		String pic2 = request.getParameter("pic2");
		if(pic2 == null) {
			pic2 = "";
		}
		String pic3 = request.getParameter("pic3");
		if(pic3 == null) {
			pic3 = "";
		}
		String pic4 = request.getParameter("pic4");
		if(pic4 == null) {
			pic4 = "";
		}
		String pic5 = request.getParameter("pic5");
		if(pic5 == null) {
			pic5 = "";
		}

		String id = db.getNewItemId();
		String regionId = db.getRegion(prefId);

		String[] str = {id,sname,genre,prefId,regionId,name,price,summary,pic1,pic2,pic3,pic4,pic5,num};

		if(db.insertNewItem(str)) {
			System.out.println("追加成功");
		}
		else {
			System.out.println("追加失敗");
		}

		db.dbClose();
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
