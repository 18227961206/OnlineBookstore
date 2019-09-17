package web.servlet;

import bean.User;
import dao.BaseDao;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户登录
 */

@WebServlet("/TheLogin")
public class TheLogin extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获取输入的数据
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		try {
			boolean successAndFailure = false;
			BaseDao baseDao = new BaseDao();
			String sql = "SELECT * FROM user";
			//将取得的数据放在list集合中
			List<User> list_id = (ArrayList<User>) baseDao.query(sql , new ColumnListHandler<>("id") , null);
			List<User> list_username = (ArrayList<User>) baseDao.query(sql , new ColumnListHandler<>("username") , null);
			List<User> list_password = (ArrayList<User>) baseDao.query(sql , new ColumnListHandler<>("password") , null);
			List<User> list_email = (ArrayList<User>) baseDao.query(sql , new ColumnListHandler<>("email") , null);
			for (int i = 0; i < list_username.size(); i++) {
				if (((String.valueOf(list_username.get(i)).equals(username)) && (String.valueOf(list_password.get(i)).equals(password))) ||
						((String.valueOf(list_email.get(i)).equals(username)) && (String.valueOf(list_password.get(i)).equals(password)))) {
					successAndFailure = true;
					req.getSession().setAttribute("usernames" , list_username.get(i));
					req.getSession().setAttribute("userId" , list_id.get(i));
				}
			}
			if (successAndFailure) {
				out.write("true");
			} else {
				out.write("false");
			}
			System.out.println(" ===successful=== ");
		} catch (Exception e) {
			out.write("false");
			System.out.println(" ===failure=== ");
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}
}
