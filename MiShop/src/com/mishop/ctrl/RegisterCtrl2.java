package com.mishop.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.entity.User;
import com.mishop.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RegisterCtrl2
 */
@WebServlet("/RegisterCtrl2")
public class RegisterCtrl2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("checkAccount".equals(method)) {
			
		} else if ("register".equals(method)) {

		}
	}

	private void checkAccount(HttpServletRequest request, HttpServletResponse response) {

	}

	private void register(HttpServletRequest request, HttpServletResponse response) {
		
	}

}
