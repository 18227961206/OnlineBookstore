package utilityclass;

import bean.BookUser;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtils;
import util.JDBCUtils;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.List;

public class HomePage {
	//查询数据表中图书类别有多少条数据
	public static void queryCount(HttpServletRequest request,String bookcategory) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		int count = 0;
		try {
			connection = JDBCUtils.getConnection();
			String sql="SELECT COUNT(*) FROM books WHERE bookcategory=?";
			preparedStatement =  connection.prepareStatement(sql);
			preparedStatement.setString(1,bookcategory);
			resultSet =  preparedStatement.executeQuery();
			//得到数据条目数
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
			//根据条目数计算有多少页，每一页有8条数据
			int counts = (int) Math.ceil(count / 20.0);
			//将数据保存
			request.getSession().setAttribute("counts" , counts);
			//System.out.println(" hompage=== "+request.getSession().getAttribute("counts"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(statement , connection , resultSet , preparedStatement);
		}
	}

	//每一页8条数据，动态读取数据并存入BookUser中HttpServletRequest request ,
	public static void queryData(HttpServletRequest request ,String bookcategory, int count) {
		//创建集合
		List<BookUser> bookUserList;
		//加载数据库驱动
		QueryRunner qr = new QueryRunner(C3P0JDBCUtils.getDataSource());
		try {
			//sql语句
			String sql = "SELECT * FROM books WHERE bookcategory=? LIMIT " + count * 20 + ",20";
			//将取得的数据放在list集合中
			bookUserList = qr.query(sql , new BeanListHandler<BookUser>(BookUser.class),bookcategory);
			//将集合保存
			request.getSession().setAttribute("bookUserList" , bookUserList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
