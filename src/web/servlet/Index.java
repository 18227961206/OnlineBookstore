package web.servlet;

import bean.BookInformation;
import bean.BookUser;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

/**
 * 数据详情
 */

@WebServlet("/Index")
public class Index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获取点击事件传入的值
		int serial_number = Integer.parseInt(req.getParameter("serial_number"));

		//创建集合
		List<BookInformation> bookInformationList = null;
		//加载数据库驱动
		QueryRunner qr = new QueryRunner(C3P0JDBCUtils.getDataSource());
		try {
			//sql语句
			String sql = "SELECT * FROM `books` WHERE id="+serial_number;
			//将取得的数据放在list集合中
			bookInformationList = qr.query(sql , new BeanListHandler<BookInformation>(BookInformation.class));
			//将集合保存
			req.setAttribute("bookInformationList" , bookInformationList);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		//resp.sendRedirect(req.getContextPath()+"/productdetails/productdetails.jsp");
		req.getRequestDispatcher("/productdetails/productdetails.jsp").forward(req , resp);

	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}
}
