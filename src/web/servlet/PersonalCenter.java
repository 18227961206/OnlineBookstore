package web.servlet;

import bean.CenterUsers;
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
 * 个人中心
 */

@WebServlet("/PersonalCenter")
public class PersonalCenter extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//接收提交的信息
		int userId = (int) req.getSession().getAttribute("userId");
		String gender = req.getParameter("gender");
		String professional = req.getParameter("professional");
		String label = req.getParameter("label");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String textarea = req.getParameter("textarea");

		System.out.println(" gender=== " + gender);
		System.out.println(" professional=== " + professional);
		System.out.println(" label=== " + label);
		System.out.println(" username=== " + username);
		System.out.println(" password=== " + password);
		System.out.println(" email=== " + email);
		System.out.println(" textarea=== " + textarea);

		try {
			DBUtilsDao dbUtilsDao = new DBUtilsDao();
			CenterUsers centerUsers = new CenterUsers();
			centerUsers.setUsername(username);
			centerUsers.setPassword(password);
			centerUsers.setEmail(email);
			centerUsers.setGender(gender);
			centerUsers.setProfessional(professional);
			centerUsers.setLabel(label);
			centerUsers.setTextarea(textarea);
			centerUsers.setId(userId);
			boolean b = dbUtilsDao.updata(centerUsers);
			System.out.println(b);
			if (b) {
				out.write("true");
				req.getSession().setAttribute("usernames" , username);
			} else {
				out.write("false");
			}
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
