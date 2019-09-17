package web.filter;

import bean.BookUser;
import utilityclass.HomePage;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 拦截jsp页面，初始化页面信息
 */

@WebFilter(urlPatterns = {
		"/index.jsp",
		"/bookcategorypage/psychology.jsp",
		"/bookcategorypage/livetolearn.jsp",
		"/bookcategorypage/foreignlanguagelearning.jsp",
		"/bookcategorypage/motivational.jsp",
		"/bookcategorypage/socialscience.jsp",
		"/bookcategorypage/academic.jsp",
		"/bookcategorypage/technology.jsp"})
public class BookCateGoryPage implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest servletRequest , ServletResponse servletResponse , FilterChain filterChain) throws IOException, ServletException {
		//将父接口转为子接口
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		//获取拦截路径
		String requestURI = request.getRequestURI();
		//定义拦截路径
		String[] bookCateGoryPagePath = {
				"/OnlineBookstore/",
				"/OnlineBookstore/index.jsp",
				"/OnlineBookstore/bookcategorypage/psychology.jsp",
				"/OnlineBookstore/bookcategorypage/livetolearn.jsp",
				"/OnlineBookstore/bookcategorypage/foreignlanguagelearning.jsp",
				"/OnlineBookstore/bookcategorypage/motivational.jsp",
				"/OnlineBookstore/bookcategorypage/socialscience.jsp",
				"/OnlineBookstore/bookcategorypage/academic.jsp",
				"/OnlineBookstore/bookcategorypage/technology.jsp"};
		//定义书类别
		String[] bookCcategory = {
				"psychology",
				"psychology",
				"psychology",
				"psychology",
				"psychology",
				"psychology",
				"psychology",
				"psychology",
				"psychology"};
		//定义跳转路径
		String[] path = {
				"index.jsp",
				"index.jsp",
				"bookcategorypage/psychology.jsp",
				"bookcategorypage/livetolearn.jsp",
				"bookcategorypage/foreignlanguagelearning.jsp",
				"bookcategorypage/motivational.jsp",
				"bookcategorypage/socialscience.jsp",
				"bookcategorypage/academic.jsp",
				"bookcategorypage/technology.jsp"};

		List<BookUser> list = (List) request.getSession().getAttribute("bookUserList");

		for (int i = 0; i < bookCateGoryPagePath.length; i++) {
			if (requestURI.equals(bookCateGoryPagePath[i])) {
				if (list == null) {
					try {
						//初始化页面信息
						HomePage.queryCount(request , bookCcategory[i]);
						HomePage.queryData(request , bookCcategory[i] , 0);
						request.getRequestDispatcher("/" + path[i]).forward(request , response);
					} catch (SQLException e) {
						request.getRequestDispatcher("/" + path[i]).forward(request , response);
						e.printStackTrace();
					}
				} else {
					request.getRequestDispatcher("/" + path[i]).forward(request , response);
				}
			}
		}
	}

	@Override
	public void destroy() {

	}
}
