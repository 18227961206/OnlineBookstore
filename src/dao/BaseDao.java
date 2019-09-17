package dao;

import org.apache.commons.dbutils.ResultSetHandler;
import util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BaseDao {
	//查询优化
	public static Object query(String sql , ResultSetHandler<?> rsh , Object[] params) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			//获得连接
			connection = JDBCUtils.getConnection();
			//预编译sql
			preparedStatement = connection.prepareStatement(sql);
			//将参数设置进去
			for (int i = 0; params != null && i < params.length; i++) {
				preparedStatement.setObject(i + 1 , params[i]);
			}
			//发送sql
			resultSet = preparedStatement.executeQuery();
			//让调用者去实现对结果集的处理
			Object object = rsh.handle(resultSet);
			return object;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null , connection , resultSet , preparedStatement);
		}
		return resultSet;
	}
}