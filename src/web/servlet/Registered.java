package web.servlet;

import bean.User;
import dao.BaseDao;
import dao.DBUtilsDao;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import util.Dates;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户注册
 */

@WebServlet("/Registered")
public class Registered extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获取输入的数据
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		//验证用户名是否重名
		try {
			BaseDao baseDao = new BaseDao();
			String sql = "SELECT * FROM user";
			//将取得的数据放在list集合中
			List<User> list = (ArrayList<User>) baseDao.query(sql , new ColumnListHandler<>("username") , null);
			if (list == null) {
				Storage(username , password , email);
				out.write("true");
			} else {
				boolean count = true;
				for (int i = 0; i < list.size(); i++) {
					if (String.valueOf(list.get(i)).equals(username)) {
						count = false;
					}
				}
				if (count) {
					Storage(username , password , email);
					out.write("true");
				} else {
					out.write("false");
				}
			}
			System.out.println(" ===successful=== ");
		} catch (Exception e) {
			out.write("false");
			System.out.println(" ===failure=== ");
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	//数据存储
	private void Storage(String username , String password , String email) {
		try {
			DBUtilsDao dbUtilsDao = new DBUtilsDao();
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setEmail(email);
			user.setDate(Dates.date());
			boolean bo = dbUtilsDao.insert(user);
			System.out.println(bo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}

}
