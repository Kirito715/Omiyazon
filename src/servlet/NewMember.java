package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MemberBean;
import logic.InsertUserData;

/**
 * Servlet implementation class NewMember
 */
@WebServlet("/NewMember")
public class NewMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMember() {
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

		if(action==null) {
			Path="jsp/user/newMemberInput.jsp";
			MemberBean mb = new MemberBean();
			mb.setJudge(false);
			mb.setJudge2(false);
			HttpSession session = request.getSession();
			session.setAttribute("beanData",mb);
		}
		else if(action.equals("done")) {
			HttpSession session=request.getSession();
			MemberBean mb = (MemberBean)session.getAttribute("beanData");
			InsertUserData iud = new InsertUserData();
			iud.insert(mb);
			session.removeAttribute("beanData");
			Path="jsp/user/newMemberComplete.jsp";
		}
		else if(action.equals("back")) {
			Path="jsp/user/newMemberInput.jsp";
		}

		response.sendRedirect(Path);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberBean mb = setBean(request);
		HttpSession session = request.getSession();
		session.setAttribute("beanData",mb);
		response.sendRedirect("jsp/newMemberConfirmation.jsp");
	}

	private MemberBean setBean( HttpServletRequest request) {
		MemberBean mb = new MemberBean();
		mb.setJudge(true);
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
			mb.setJudge2(true);
		}else {
			mb.setJudge2(false);
		}
		return mb;
	}

}
