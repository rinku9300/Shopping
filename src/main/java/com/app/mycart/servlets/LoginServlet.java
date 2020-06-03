package com.app.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import com.app.mycart.dao.UserDao;
import com.app.mycart.entities.User;
import com.app.mycart.helper.FactroyProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			//

			String email = request.getParameter("email");
			String password = request.getParameter("password");
			// Validation

			// Authenticating User
			UserDao userDao = new UserDao(FactroyProvider.getFactory());
			User user = userDao.gerUserByEmailAndPassword(email, password);
			System.out.println(user);
			HttpSession httpSession = request.getSession();
			if (user == null) {
				out.println("<h1> invalid user</h>");
				httpSession.setAttribute("message", "invalid details ! try with another one");
				response.sendRedirect("login.jsp");
				return;
			} 
			else
				out.println("<h1>Welcome - " + user.getUserName() + "</h1>");
			//Login
			httpSession.setAttribute("current-user", user);
			if(user.getUserType().equals("admin")) {
				//admin:- admin.jsp
				response.sendRedirect("admin.jsp");;
			}else if (user.getUserType().equals("normal")){
				//normal:- user.jsp
				response.sendRedirect("normal.jsp");
			}else
				out.println("No user found");
			
		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
