package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ColorSet
 */
@WebServlet("/ColorSet")
public class ColorSet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ColorSet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String str=request.getParameter("str");
		String[][] color =new String[10][2];

		for(int i=0; i <= str.length()-1;i++) {
			if(str.charAt(i)=='0') {
				color[i][0]="#BDBDBD";
				color[i][1]="#E6E6E6";
			}else {
				color[i][0]="#FF0000";
				color[i][1]="#FA5858";
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("color", color);
		response.sendRedirect("jsp/japanmap.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
