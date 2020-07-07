package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DetailBean;
import common.DBClass;

/**
 * Servlet implementation class ItemDetail
 */
@WebServlet("/ItemDetail")
public class ItemDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action =request.getParameter("action");
		HttpSession session = request.getSession();
		DetailBean bean = new DetailBean();

		if(action==null) {
		int itemid= Integer.parseInt(request.getParameter("itemid"));
		String uid = request.getParameter("userid");
		if(uid != null) {
			int userid= Integer.parseInt(request.getParameter("userid"));
			bean.setUserid(userid);
			bean.setLogin(true);
		}
		else {
			bean.setLogin(false);
		}
		bean.setItemid(itemid);
		DBClass db=new DBClass();
		db.dbOpen();
		bean = db.getDetailData(bean);
		db.dbClose();
		double sum=0;
		if(bean.getReviewList().size()>1) {
			for(int i=1;i<bean.getReviewList().size();i++) {
				sum +=  Integer.parseInt(bean.getReviewList().get(i)[2]);
			}
			bean.setAvgqua(sum/(bean.getReviewList().size()-1));
		}
		session.setAttribute("DetaillBean",bean);
		}else{
			bean = (DetailBean)session.getAttribute("DetaillBean");
			DBClass db=new DBClass();
			db.dbOpen();
			if(action.equals("new")) {
				db.getReview(bean);
			}else if (action.equals("quo")) {
				db.getReview(bean,0);

			}
			db.dbClose();
			session.setAttribute("DetaillBean",bean);
		}

		response.sendRedirect("jsp/user/itemDetail.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}