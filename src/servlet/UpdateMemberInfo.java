package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MemberBean;
import common.DBClass;

/**
 * Servlet implementation class UpdateMemberInfo
 */
@WebServlet("/UpdateMemberInfo")
public class UpdateMemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String Path = null;
		String action = request.getParameter("action");

		HttpSession session = request.getSession();

		if(action==null) {
			Path="jsp/user/updateMemberInfo.jsp";
			MemberBean bean = new MemberBean();

			bean.setUserId(Integer.parseInt((String)session.getAttribute("userId")));

			DBClass db = new DBClass();
			db.dbOpen();
			bean=db.getUserData(bean);
			db.dbClose();

			bean.setPcode2(bean.getPcode().substring(3));
			bean.setPcode(bean.getPcode().substring(0,3));

			String s = "0";
			if(bean.getMonth().length()==1) {
				bean.setMonth(s+bean.getMonth());
			}
			if(bean.getDay().length()==1) {
				bean.setDay(s+bean.getDay());
			}


			session.setAttribute("beanData",bean);
		}
		else if(action.equals("done")) {

			MemberBean bean = (MemberBean)session.getAttribute("beanData");
			DBClass db = new DBClass();
			db.dbOpen();
			db.updateUserData(bean);
			db.dbClose();
			session.removeAttribute("beanData");
			Path="jsp/user/updateMemberComplete.jsp";
		}
		else if(action.equals("back")) {
			Path="jsp/user/updateMemberInfo.jsp";
		}
		response.sendRedirect(Path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberBean mb = (MemberBean)session.getAttribute("beanData");
		mb.setNickname(request.getParameter("nickName"));
		mb.setPass(request.getParameter("pass"));
		mb.setPass2(request.getParameter("pass2"));
		mb.setGender(request.getParameter("gender"));
		mb.setYear(request.getParameter("year"));
		mb.setMonth(request.getParameter("month"));
		mb.setDay(request.getParameter("day"));
		mb.setEmail(request.getParameter("email"));
		mb.setEmail2(request.getParameter("email2"));
		mb.setName(request.getParameter("name"));
		mb.setFurigana(request.getParameter("furigana"));
		mb.setPcode(request.getParameter("pcode"));
		mb.setPcode2(request.getParameter("pcode2"));
		mb.setAdd(request.getParameter("add"));
		if(request.getParameter("add2").length() != 0){
			mb.setAdd2(request.getParameter("add2"));
		}
		session.setAttribute("beanData",mb);
		response.sendRedirect("jsp/user/updateMemberConfirmation.jsp");
	}

}
