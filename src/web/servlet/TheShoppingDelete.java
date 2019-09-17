package web.servlet;

import dao.DBUtilsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * 删除订单
 */

@WebServlet("/TheShoppingDelete")
public class TheShoppingDelete extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		int shoppingids = Integer.parseInt(req.getParameter("shoppingids"));
		System.out.println("shoppingids=== "+shoppingids);
		try {
			DBUtilsDao dao = new DBUtilsDao();
			boolean b = dao.deleteCart(shoppingids);
			System.out.println(b);
			out.write("true");
		} catch (SQLException e) {
			out.write("false");
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}
}
