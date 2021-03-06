package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DBClass;

/**
 * Servlet implementation class kounyuu2
 */
@WebServlet("/kounyuu2")
public class kounyuu2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kounyuu2() {
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
		String zyusyo1=request.getParameter("zyusyo1");
		String zyusyo2=request.getParameter("zyusyo2");
		String uid=request.getParameter("uid");
		String num=request.getParameter("num");
		String path=null;
		Date a = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = dateFormat.format(a);
		DBClass db = new DBClass();
		db.dbOpen();
		ArrayList<String[]> ary = db.getcart(uid);
		int buynum = 0;
		int buyid=0;

		for(int i=0;i<ary.size();i++) {
			buyid=Integer.parseInt(ary.get(i)[0]);
			buynum=Integer.parseInt(ary.get(i)[2]);
			if(db.getOrdable(buyid)-db.getStock(buyid)-buynum < 0) {
				session.setAttribute("overid",buyid);
				session.setAttribute("overitem",(String)db.getItemName(buyid));
				path="jsp/cartError.jsp";
			}
		}
		if(path==null) {
		db.insertdenpyou(uid,date,num,zyusyo1,zyusyo2);
		for(int i=0;i<ary.size();i++) {
			db.inserturiage(ary.get(i)[0],ary.get(i)[2] ,ary.get(i)[5]);
		}
		db.deleteAllcart(uid);
		path="jsp/Complete.jsp";
		}
		db.dbClose();
			response.sendRedirect(path);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
