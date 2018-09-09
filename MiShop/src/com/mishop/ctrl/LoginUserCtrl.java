package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mishop.entity.User;
import com.mishop.service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginUserCtrl
 */
@WebServlet("/LoginUserCtrl")
public class LoginUserCtrl extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
//	@Override
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String method = request.getParameter("method");
//		if(method == "login") {
//			System.out.println(method);
//			login(request,response);
//		}else if(method=="register") {
//			register(request,response);
//		}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和密码
		String userName = request.getParameter("userName").trim();
		String userPassword = request.getParameter("userPassword").trim();
		
		User user= UserServiceImpl.getUserService().getUser(userName,userPassword);
		System.out.println(user.getUserId());
		PrintWriter out = response.getWriter();
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("USER_ID", user.getUserId());
			session.setAttribute("USER", user);
			out.print("true");
		}else {
			out.print("false");
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
		
	}
	
}