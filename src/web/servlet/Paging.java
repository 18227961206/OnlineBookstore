package web.servlet;

import utilityclass.HomePage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 页数点击事件,数据刷新
 */

@WebServlet("/Paging")
public class Paging extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();

		String bookcategory = "psychology";
		int countPaging = Integer.parseInt(req.getParameter("countPaging"));
		System.out.println(" countPaging===== " + countPaging);
		try {
			HomePage.queryData(req , bookcategory , countPaging);
			out.write("true");
		} catch (Exception e) {
			out.write("false");
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}
}
