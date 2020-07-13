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
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
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
		DBClass db = new DBClass();
		String id=request.getParameter("id");
		id="1";
		db.dbOpen();
		ArrayList<String[]> ary = db.getcart(id);
		ArrayList<Integer> ary2 = new ArrayList<Integer>();

		int buyid=0;
		int ordable=0;
		for(int i=0;i<ary.size();i++) {
			buyid=Integer.parseInt(ary.get(i)[0]);
			ordable=db.getOrdable(buyid)-db.getStock(buyid);
			ary2.add(ordable);
			if(ordable<1) {
				ary.get(i)[2]="在庫がありません";
			}
		}

		db.dbClose();
		session.setAttribute("cart",ary);
		session.setAttribute("max",ary2);
		session.setAttribute("uid",id);

		response.sendRedirect("jsp/cart.jsp");
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
