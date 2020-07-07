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


		//actionがnullのとき初期設定
		if(action==null) {
			int itemid= Integer.parseInt(request.getParameter("itemid"));
			bean.setItemid(itemid);
			String uid = request.getParameter("userid");

			if(uid != null) {
				int iuid= Integer.parseInt(uid);
				bean.setUserid(iuid);
				bean.setLogin(true);
			}
			else {
				bean.setLogin(false);
			}

		DBClass db=new DBClass();
		db.dbOpen();
		bean = db.getDetailData(bean);
		db.dbClose();
		//平均値処理
		if(bean.getReviewList().size()>1) {
			bean=getAverage(bean);
		}
		session.setAttribute("DetaillBean",bean);
		}//ここまで初期設定
		 //カートの追加
		else if(action.equals("cart")) {
			bean = (DetailBean)session.getAttribute("DetaillBean");
			System.out.println("カートに追加");
			DBClass db=new DBClass();
			db.dbOpen();
			db.addCart(bean);
			bean = db.judgeCart(bean);
			db.dbClose();
		}
		else{
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
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		DetailBean bean = (DetailBean)session.getAttribute("DetaillBean");
		String review = request.getParameter("review");
		int star = Integer.parseInt(request.getParameter("star"));
		DBClass db=new DBClass();
		db.dbOpen();
		db.insertReview(review,star,bean);
		bean = db.getDetailData(bean);
		db.dbClose();
		//平均値処理
		if(bean.getReviewList().size()>1) {
			bean=getAverage(bean);
		}
		session.setAttribute("DetaillBean",bean);
		response.sendRedirect("jsp/user/itemDetail.jsp");
	}

	private DetailBean getAverage(DetailBean bean) {
		double sum=0;
		for(int i=1;i<bean.getReviewList().size();i++) {
			sum +=  Integer.parseInt(bean.getReviewList().get(i)[2]);
		}
		bean.setAvgqua(sum/(bean.getReviewList().size()-1));
		return bean;
	}

}