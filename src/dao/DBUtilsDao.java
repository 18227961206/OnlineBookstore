package dao;

import bean.CenterUsers;
import bean.TheShoppingCartBean;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.C3P0JDBCUtils;
import util.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class DBUtilsDao {
	//查询所有，返回List集合
	public List findAll() throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3P0JDBCUtils.getDataSource());
		//写sql语句
		String sql = "select * from user";
		//调用方法
		List list = queryRunner.query(sql , new BeanListHandler<>(User.class));
		return list;
	}

	//查询单个，返回对象
	public User find(int id) throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
		//写sql语句
		String sql = "select * from user where id=?";
		//调用方法
		User user = queryRunner.query(sql , new BeanHandler<>(User.class) , id);
		return user;
	}

	//添加用户的操作
	public Boolean insert(User user) throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
		//写sql语句
		String sql = "insert into user(username,password,email,date) value(?,?,?,?)";
		//调用方法
		int num = queryRunner.update(sql , user.getUsername() , user.getPassword() , user.getEmail() , user.getDate());
		if (num > 0) {
			return true;
		}
		return false;
	}

	//修改用户的操作
	public Boolean updata(CenterUsers centerUser) throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
		//写sql语句
		String sql = "UPDATE `user` SET username=?,password=?,email=?,gender=?,professional=?,label=?,textarea=? WHERE id=?";
		//调用方法
		int num = queryRunner.update(sql , centerUser.getUsername() , centerUser.getPassword() , centerUser.getEmail() , centerUser.getGender() , centerUser.getProfessional() , centerUser.getLabel() , centerUser.getTextarea() , centerUser.getId());
		if (num > 0) {
			return true;
		}
		return false;
	}

	//删除用户的操作
	public Boolean delete(int id) throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
		//写sql语句
		String sql = "delete from user where id=?";
		//调用方法
		int num = queryRunner.update(sql , id);
		if (num > 0) {
			return true;
		}
		return false;
	}


	//添加购物车数据
	public Boolean insertCart(TheShoppingCartBean cartBean) throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
		//写sql语句
		String sql = "insert into bookshoppingcart(bookname,bookimage,bookmoney,booktheordernumber,bookcreationtime) value(?,?,?,?,?)";
		//调用方法
		int num = queryRunner.update(sql , cartBean.getBookname() , cartBean.getBookimage() , cartBean.getBookmoney() , cartBean.getBooktheordernumber() , cartBean.getBookcreationtime());
		if (num > 0) {
			return true;
		} else {
			return false;
		}
	}

	//删除购物车数据
	public Boolean deleteCart(int id) throws SQLException {
		//创建QueryRunner对象
		QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
		//写sql语句
		String sql = "DELETE FROM bookshoppingcart WHERE id=?";
		//调用方法
		int num = queryRunner.update(sql , id);
		if (num > 0) {
			return true;
		}
		return false;
	}
}
