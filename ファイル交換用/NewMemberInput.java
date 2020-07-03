package logic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBeans;

/**
 * Servlet implementation class NewMemberInput
 */
@WebServlet("/NewMemberInput")
public class NewMemberInput extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMemberInput() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// 日本語入力の受付
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// セッションの初期設定
		HttpSession session = request.getSession();

		// 受け取ったワードを挿入
		String sID			= (String) request.getParameter("userID");
		String sNN			= (String) request.getParameter("NN");
		String sName		= (String) request.getParameter("name");
		String sHurihuri	= (String) request.getParameter("hurihuri");
		String sYear		= (String) request.getParameter("year");
		String sMonth		= (String) request.getParameter("month");
		String sDay			= (String) request.getParameter("day");
		String sGender		= (String) request.getParameter("gender");
		String sPos_1		= (String) request.getParameter("pos_1");
		String sPos_2		= (String) request.getParameter("pos_2");
		String sAddress_1	= (String) request.getParameter("Address_1");
		String sAddress_2	= (String) request.getParameter("Address_2");
		String sPass		= (String) request.getParameter("pass");
		String sCheckPass	= (String) request.getParameter("passcheck");

		// Beanの使用
		UserBeans ub = new UserBeans();		// インスタンスの作成
		ub.setbUserID(sID);					// IDのセット
		ub.setbNN(sNN);
		ub.setbName(sName);
		ub.setbHurihuri(sHurihuri);
		ub.setbBirth(sYear + sMonth + sDay);
		ub.setbGender(sGender);
		ub.setbPos(sPos_1 + sPos_2);
		ub.setbAddress_1(sAddress_1);
		ub.setbAddress_2(sAddress_2);
		ub.setbPass(sPass);
		ub.setbCheckPass(sCheckPass);
		UserBeans.setInstance(ub);

		// セッション属性を使った値のセット
		session.setAttribute("UserID",sID);
		session.setAttribute("NN",sNN);
		session.setAttribute("Name",sName);
		session.setAttribute("Hurihuri",sHurihuri);
		session.setAttribute("Year",sYear);
		session.setAttribute("Month",sMonth);
		session.setAttribute("Day",sDay);
		session.setAttribute("Gender",sGender);
		session.setAttribute("Pos_1",sPos_1);
		session.setAttribute("Pos_2",sPos_2);
		session.setAttribute("Address_1",sAddress_1);
		session.setAttribute("Address_2",sAddress_2);
		session.setAttribute("Pass",sPass);
		session.setAttribute("CheckPass",sCheckPass);

		// セットした値をjspに送信(リダイレクト)
		response.sendRedirect("jsp/Member/newMemberConfirmation.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
