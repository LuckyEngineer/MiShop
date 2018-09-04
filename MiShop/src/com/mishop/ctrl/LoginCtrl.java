package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.entity.Admin;
import com.mishop.service.impl.AdminServiceImpl;
import com.mishop.utils.MD5Util;

/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		// 指定请求文本的编码
		request.setCharacterEncoding("UTF-8");
		// 设置响应文本的编码
		response.setCharacterEncoding("UTF-8");
		// 设置响应文本的类型
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 获取用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remeber = request.getParameter("remeber");
		Admin admin = new AdminServiceImpl().queryUserByName(username);
		if(admin == null) {
			// 如果返回为空，则说明账号不存在
			out.print("invalid user");
		} else {
			if(!MD5Util.crypt(password).equals(admin.getAdminPassword())) {
				// 密码错误
				out.print("invalid password");
			} else {
				// 1、通过request获取session
				HttpSession session = request.getSession();
				// 2、通过setAttribute设置session的对象名和对象值
				session.setAttribute("admin", admin.getAdminAccount());
				session.setAttribute("adminId", admin.getAdminId());
				session.setAttribute("role", admin.getRole());
				// 3、设置session的有效非活动时间
				session.setMaxInactiveInterval(30*60);
				// 设置 cookie
				if(remeber.equals("true")) {
					// 1、创建Cookie
					Cookie c1 = new Cookie("username",username);
					Cookie c2 = new Cookie("password",password);
					response.addCookie(c1);
					response.addCookie(c2);
				} else {
					// 删除cookie
					// 获取所有cookie,遍历所有cookie,删除username和password
					Cookie[] cookies = request.getCookies();
					for(Cookie c : cookies) {
						if(c.getName().equals("username") || c.getName().equals("password")) {
							c.setPath("/");
							c.setMaxAge(0);
						}
					}
				}
				// success
				out.print("correct");
			}
		}
	}
	
}
