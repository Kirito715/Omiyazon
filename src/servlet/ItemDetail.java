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

		int userid=1;
		DetailBean bean = new DetailBean();
		bean.setLogin(true);


		//int itemid= Integer.parseInt(request.getParameter("itemid"));
		int itemid=1;
		bean.setUserid(userid);
		bean.setItemid(itemid);

		DBClass db=new DBClass();
		db.dbOpen();
		bean = db.getDetailData(bean);
		db.dbClose();
		
		int avg=0;
		if(bean.getReviewList()!=null) {
			for(int i=0;i<bean.getReviewList().size();i++) {
				avg +=  bean.getReviewList(i)[2];
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("DetaillBean",bean);
		response.sendRedirect("jsp/itemDetail.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
