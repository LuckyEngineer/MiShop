package com.mishop.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import org.apache.catalina.ha.backend.Sender;
import org.apache.coyote.Request;

import com.mishop.entity.User;
import com.mishop.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RegisterCtrl
 */
@WebServlet("/RegisterCtrl")
public class RegisterCtrl extends HttpServlet {

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
		// 将信息拿进来
		String name = request.getParameter("name").trim();
		String psw = request.getParameter("psw").trim();
		String email = request.getParameter("email").trim();
		System.out.println(email);
		String tel = request.getParameter("tel").trim();
		// 得到用户输入的验证码
		int code = Integer.parseInt(request.getParameter("code").trim());
		HttpSession session = request.getSession(true);
		int code1 = (Integer) session.getAttribute("CODE");// 获取发送的验证码
		if (code1 == code) {// 验证码正确
			// 验证用户是否已存在
			User user = UserServiceImpl.getUserService().queryUserByName(name);
			if(user != null) {
				request.setAttribute("errorinfo", "用户名已存在");
				request.getRequestDispatcher("/register-failed.jsp").forward(request, response);
			} else {
				// 插入用户信息
				User users = new User();
				users.setUserName(name);
				users.setUserPassword(psw);
				users.setEmail(email);
				users.setTel(tel);
				users.setStatus(0);
				UserServiceImpl.getUserService().Register(users);
				response.sendRedirect("/login.jsp");
			}
			/*
			List<User> user = UserServiceImpl.getUserService().getUser();// 获取数据库中的用户
			for (User u : user) {
				if (u.getUserName().equals("name")) {
					// 用户名存在
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				} else {
					// 用户名不存在
					// 判断邮箱
					if (email == u.getEmail()) {
						// 如果邮箱存在
						System.out.println("邮箱存在！");
						request.getRequestDispatcher("/register.jsp").forward(request, response);
					} else {// 用户名不存在，邮箱不存在，判断手机号码
						if (tel == u.getEmail()) {
							System.out.println("手机号存在");
							request.getRequestDispatcher("/register.jsp").forward(request, response);
						} else {// 用户名、邮箱、手机号都不存在，可以注册
							User users = new User();
							users.setUserName(name);
							users.setUserPassword(psw);
							users.setEmail(email);
							users.setTel(tel);
							users.setStatus(0);
							UserServiceImpl.getUserService().Register(users);
							response.sendRedirect("/login.jsp?name=" + name + "&password=" + psw);
						}
					}
				}
			}*/

		} else {
			request.setAttribute("errorinfo", "验证码错误");
			request.getRequestDispatcher("/register-failed.jsp").forward(request, response);
		}
	}
}