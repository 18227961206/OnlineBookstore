package web.filter;

import bean.CenterUser;
import bean.TheShoppingCartFilterBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 个人中心
 */

@WebFilter("/personalcenter/personalcenter.jsp")
public class PersonalCenterFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest servletRequest , ServletResponse servletResponse , FilterChain filterChain) throws IOException, ServletException {
		//将父接口转为子接口
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String username = (String) request.getSession().getAttribute("usernames");
		List<CenterUser> centerUsers;
		try {
			//加载数据库驱动
			QueryRunner qr = new QueryRunner(C3P0JDBCUtils.getDataSource());
			//sql语句
			String sql = "SELECT * FROM user WHERE username=?";
			//将取得的数据放在list集合中
			centerUsers = qr.query(sql , new BeanListHandler<CenterUser>(CenterUser.class),username);
			//将集合保存
			request.getSession().setAttribute("centerUsers" , centerUsers);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("/personalcenter/personalcenter.jsp").forward(request , response);

	}

	@Override
	public void destroy() {

	}
}
