package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 用户退出
 */

@WebServlet("/Exits")
public class Exits extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String exits = req.getParameter("exits");
		System.out.println(" exits=== " + exits);
		if (!exits.equals("")) {
			//删除Session域中的用户名
			req.getSession().removeAttribute("usernames");
			out.write("true");
		} else {
			out.write("false");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}

}
