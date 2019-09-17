package web.servlet;

import org.apache.commons.mail.SimpleEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 发送QQ邮箱验证码
 */

@WebServlet("/EmailVerificationCode")
public class EmailVerificationCode extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获取输入的邮箱
		String email = req.getParameter("email");
		System.out.println("========email:" + email);
		//生成随机验证码
		StringBuilder authCode = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			int rand = (int) (Math.random() * 10);
			authCode.append(rand);
		}
		System.out.println(" ========authCode====== " + authCode.toString());
		//发送邮箱验证码
		try {
			//返回到前台的验证码
			out.write(authCode.toString());

			SimpleEmail mail = new SimpleEmail();
			//发送邮件的服务器
			mail.setHostName("smtp.qq.com");
			//授权码
			mail.setAuthentication("2280514662@qq.com" , "kghwuhvwbiusebac");
			//发送邮件的邮箱和发件人
			mail.setFrom("2280514662@qq.com" , "柳生天涯");
			//使用安全链接
			mail.setSSLOnConnect(true);
			//接收的邮箱地址
			mail.addTo(email);
			//设置邮件的主题
			mail.setSubject(authCode.toString());
			//设置邮件的内容
			mail.setMsg("尊敬的用户:你好!\n你注册网上书城的验证码为：" + authCode.toString() + "\t" + "(有效期为30分钟)");
			//发送
			mail.send();
			System.out.println(" ===successful=== ");
		} catch (Exception e) {
			out.write("false");
			System.out.println(" ===failure=== ");
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
		doGet(req , resp);
	}
}
