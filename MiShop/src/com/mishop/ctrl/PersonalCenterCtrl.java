package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.entity.User;
import com.mishop.service.impl.UserServiceImpl;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PersonalCenterCtrl
 */
@WebServlet("/PersonalCenterCtrl")
public class PersonalCenterCtrl extends HttpServlet {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
/**
    * 控制跳转
    */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("method");
		if(str.equals("prod")) {
			this.updateUser(request, response);
		}else if(str.equals("success")) {
			this.updateInformation(request, response);
		}
	}
	/**
	 * 将信息传递到修改页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("heihehei");
		String userStr=request.getParameter("objectInfo");
		JSONObject json=new JSONObject().fromObject(userStr);
		User user=new User();
		user.setUserName(json.getString("userName"));
		user.setUserRealName(json.getString("realName"));
		user.setSex(json.getString("sex"));
		user.setBirthday(json.getString("bir"));
		user.setTel(json.getString("tel"));
		user.setEmail(json.getString("email"));
		request.setAttribute("USER", user);
		PrintWriter out = response.getWriter();
		out.print(user);
//		request.getRequestDispatcher("user-update.jsp").forward(request, response);
	}
	/**
	 * 将信息传递回个人信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收修改页面传递回来的信息
		String realName=request.getParameter("realName");
		String sex=request.getParameter("sex");
		String bir=request.getParameter("bir");
		//将用户信息从用户中取出
		HttpSession session = request.getSession(true);
		int userId=(Integer) session.getAttribute("USER_ID");
		User user=(User) session.getAttribute("USER");
		user.setUserId(userId);
		user.setUserRealName(realName);
		user.setSex(sex);
		user.setBirthday(bir);
		
		//将信息传递到数据库
		boolean judge=UserServiceImpl.getUserService().updateInformation(user);
		
		PrintWriter out = response.getWriter();
		if(judge) {
			session.setAttribute("USER", user);
			out.print("true");
		}else {
			out.print("false");
		}
	}
}