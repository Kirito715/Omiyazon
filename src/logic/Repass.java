package logic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DBClass;

/**
 * Servlet implementation class Repass
 */
@WebServlet("/Repass")
public class Repass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Repass() {
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
		response.setContentType("text/html;charset=UTF-8");

		//画面遷移確認
		System.out.println("RePassの中身");

		// 入力パラメタ取得
		String UserMail=request.getParameter("Mail");

		//入力パラメーター確認
		System.out.println(UserMail);


		HttpSession  Session = request.getSession();
		Session.setAttribute("text",UserMail );


		//DBクラス生成
		DBClass db = new DBClass();

		// DB接続
		db.dbOpen();

		// ログインチェック
		if (db.RePass(UserMail)) {

			Session.setAttribute("userMail", UserMail);

			//パスワード再設定
			response.sendRedirect("jsp/user/PassReconf.jsp");

		} else {
			System.out.println("エラー");
			//ログイン画面遷移
			response.sendRedirect("jsp/user/repass.jsp");
		}

		// DB切断
		db.dbClose();
	}


}
