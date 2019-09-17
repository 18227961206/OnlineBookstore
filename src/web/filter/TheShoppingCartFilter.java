package web.filter;

import bean.TheShoppingCartFilterBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 购物车信息
 */

@WebFilter("/theshoppingcart/theshoppingcart.jsp")
public class TheShoppingCartFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest servletRequest , ServletResponse servletResponse , FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		//创建集合
		List<TheShoppingCartFilterBean> bookShoppingCartList;
		try {
			//加载数据库驱动
			QueryRunner qr = new QueryRunner(C3P0JDBCUtils.getDataSource());
			//sql语句
			String sql = "SELECT * FROM bookshoppingcart";
			//将取得的数据放在list集合中
			bookShoppingCartList = qr.query(sql , new BeanListHandler<TheShoppingCartFilterBean>(TheShoppingCartFilterBean.class));
			//将集合保存
			request.setAttribute("bookShoppingCartList" , bookShoppingCartList);
			request.getRequestDispatcher("/theshoppingcart/theshoppingcart.jsp").forward(servletRequest,servletResponse);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {

	}
}
