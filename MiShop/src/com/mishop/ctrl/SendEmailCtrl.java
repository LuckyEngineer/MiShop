package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.utils.RandomUtil;
import com.mishop.utils.SendMail;

/**
 * Servlet implementation class SendEmailCtrl
 */
@WebServlet("/SendEmailCtrl")
public class SendEmailCtrl extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		// 发送邮件，获取要发送的验证码
		int code1 = RandomUtil.getRandomUtil().GetRandomNumber();
		String email = request.getParameter("email").trim();
		session.setAttribute("EMAIL", email);
		// 发送验证码，在工具包提供了一个方法
		if (code1 != 0) {// 获取成功，开始发送
			session.setAttribute("CODE", code1);
			SendMail.getSendMail().sendEmail(email, code1);
			out.print("success");
			// System.out.println("发送成功！！");
		} else {
			out.print("failed");;
			// System.out.println("请求验证码失败");
		}
	}

}
