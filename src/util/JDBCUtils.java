package util;

import java.sql.*;

public class JDBCUtils {
	//加载驱动，并建立数据库连接
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/bookstore?characterEncoding=UTF-8";
		String username = "root";
		String password = "ewqdsacxzws";
		Connection connection = DriverManager.getConnection(url , username , password);
		return connection;
	}

	//关闭数据库连接，释放资源
	public static void release(Statement statement , Connection connection , ResultSet resultSet , PreparedStatement preparedStatement) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			statement = null;
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connection = null;
		}
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resultSet = null;
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			preparedStatement = null;
		}
	}
}
