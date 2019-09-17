package util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class C3P0JDBCUtils {

	//创建一个ThreadLocal对象，以当前线程作为key
	private static ThreadLocal<Connection> threadLocal = new ThreadLocal<Connection>();
	//从c3p0-config.xml配置文件中读取默认的数据库配置，生成c3p0数据源
	private static DataSource dataSource = new ComboPooledDataSource();

	//返回数据源对象
	public static DataSource getDataSource() {
		return dataSource;
	}

	//获取c3p0数据库连接池中的连接对象
	public static Connection getConnection() throws SQLException {
		Connection connection = threadLocal.get();
		if (connection == null) {
			connection = dataSource.getConnection();
			threadLocal.set(connection);
		}
		return connection;
	}

	//开启事务
	public static void startThreadLocal() {
		try {
			//获得连接
			Connection connection = getConnection();
			//开启事务
			connection.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//提交事务
	public static void commit() {
		try {
			//获取连接
			Connection connection = threadLocal.get();
			//提交事务
			if (connection != null) {
				connection.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//回滚事务
	public static void rollback() {
		try {
			//获取连接
			Connection connection = threadLocal.get();
			//回滚事务
			if (connection != null) {
				connection.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//关闭数据库连接，释放资源
	public static void colse() {
		//获取连接
		Connection connection = threadLocal.get();
		//关闭事务
		if (connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				//从集合中移除当前绑定的连接
				threadLocal.remove();
				connection = null;
			}
		}
	}
}
