package eg;

import bean.CenterUser;
import bean.CenterUsers;
import dao.BaseDao;
import dao.DBUtilsDao;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import util.Dates;
import utilityclass.HomePage;

import java.sql.SQLException;

public class Eg01 {
	public static void main(String[] args) throws SQLException {
		/*String str = "michael";
		StringBuilder result = new StringBuilder();
		for (int i = 0; i < 3; i++) {
			result.append(str.charAt(i));
		}
		System.out.println(result+"...");*/
		//BaseDao baseDao = new BaseDao();
		/*String sql = "SELECT bookname FROM `books` WHERE id=?";
		Object[] arr = (Object[]) BaseDao.query(sql,new ArrayHandler(),new Object[]{2});
		System.out.println(arr[0]);*/

		/*try {
			DBUtilsDao dao = new DBUtilsDao();
			boolean b = dao.deleteCart(44);
			System.out.println(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}*/

		try {
			DBUtilsDao dbUtilsDao = new DBUtilsDao();
			CenterUsers centerUsers = new CenterUsers();
			centerUsers.setUsername("michael");
			centerUsers.setPassword("123456");
			centerUsers.setEmail("2280514662@qq.com");
			centerUsers.setGender("男");
			centerUsers.setProfessional("学生");
			centerUsers.setLabel("广告");
			centerUsers.setTextarea("天狼星");
			centerUsers.setId(4);
			boolean b = dbUtilsDao.updata(centerUsers);
			System.out.println(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
