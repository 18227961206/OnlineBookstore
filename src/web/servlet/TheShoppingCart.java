package web.servlet;

import bean.TheShoppingCartBean;
import dao.DBUtilsDao;
import util.Dates;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * 加入购物车，存储订单
 */

@WebServlet("/TheShoppingCart")
public class TheShoppingCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();

		//获取订单信息
		String bookname = req.getParameter("booknamecart");
		String bookimage = req.getParameter("bookimagecart");
		String bookmoney = req.getParameter("bookmoneycart");
		String booktheordernumber = req.getParameter("booktheordernumber");
		String bookcreationtime = Dates.date();

		//订单数据存储
		try {
			DBUtilsDao dbUtilsDao = new DBUtilsDao();
			TheShoppingCartBean cartBean = new TheShoppingCartBean();
			cartBean.setBookname(bookname);
			cartBean.setBookimage(bookimage);
			cartBean.setBookmoney(bookmoney);
			cartBean.setBooktheordernumber(booktheordernumber);
			cartBean.setBookcreationtime(bookcreationtime);
			boolean bo = dbUtilsDao.insertCart(cartBean);
			System.out.println(bo);
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
