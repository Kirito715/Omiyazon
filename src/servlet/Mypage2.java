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
 * Servlet implementation class Mypage2
 */
@WebServlet("/Mypage2")
public class Mypage2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage2() {
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
		String uid=request.getParameter("uid");
		String sid=request.getParameter("sid");
		String button=request.getParameter("button");
		DBClass db = new DBClass();
		db.dbOpen();
		//個人情報更新
		if(button.equals("1")) {
			response.sendRedirect("UpdateMemberInfo");
		}
		//購入履歴一覧
		else if(button.equals("2")) {
			ArrayList<String[]> b = db.getrecode(uid);
			session.setAttribute("myrecode",b);
			response.sendRedirect("jsp/recode.jsp");
			}
		//お気に入り一覧
		else if(button.equals("3")) {
			ArrayList<String[]> c = db.getbook(uid);
			session.setAttribute("mybook",c);

			response.sendRedirect("jsp/book.jsp");
		}
		//ログアウト
		else if(button.equals("4")) {
			session.invalidate();
			response.sendRedirect("TopPage");
		}
		//商品詳細へ
		else if(button.equals("5")) {
			session.setAttribute("itemid",sid);
			response.sendRedirect("ItemDetail");
		}
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
