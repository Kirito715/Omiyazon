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
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");

		//画面遷移確認
		System.out.println("UserLoginの中身");

		// 入力パラメタ取得
		String UserMail=request.getParameter("Mail");
		String UserPass=request.getParameter("Pass");

		//入力パラメーター確認
		System.out.println(UserMail);
		System.out.println(UserPass);

		HttpSession  Session = request.getSession();
		Session.setAttribute("text",UserMail );
		Session.setAttribute("password",UserPass );


		//DBクラス生成
		DBClass db = new DBClass();

		// DB接続
		db.dbOpen();

		// ログインチェック
		if (db.UserLogin(UserMail,UserPass)) {

			Session.setAttribute("userMail", UserMail);
			Session.setAttribute("userId", db.getUserId(UserMail,UserPass));
			//マイページ遷移
			response.sendRedirect("Mypage");

		} else {
			System.out.println("エラー");
			//ログイン画面遷移
			response.sendRedirect("jsp/user/Login.jsp");
		}

		// DB切断
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
