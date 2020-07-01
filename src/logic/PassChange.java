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
 * Servlet implementation class PassChange
 */
@WebServlet("/PassChange")
public class PassChange extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassChange() {
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
		System.out.println("PassChangeの中身");

		// 入力パラメタ取得
		String NewPass=request.getParameter("NewPass");
		String ConfPass=request.getParameter("ConfPass");
		//入力パラメーター確認
				System.out.println(NewPass);
				System.out.println(ConfPass);
				HttpSession  Session = request.getSession();
				Session.setAttribute("text",NewPass );
				Session.setAttribute("text",ConfPass );
				//DBクラス生成
				DBClass db = new DBClass();

				// DB接続
				db.dbOpen();

				String userMail = (String)Session.getAttribute("userMail");


					if(NewPass.equals(ConfPass)) {

						// editItemDataを実行
						int data = db.PassUpd(NewPass,userMail);

						//パスワード再設定確認遷移
						response.sendRedirect("jsp/user/PassChange.jsp");
					}
					else {
						response.sendRedirect("jsp/user/PassReconf.jsp");
					}



				// DB切断
				db.dbClose();
	}

}
