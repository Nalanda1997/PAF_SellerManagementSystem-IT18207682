package com;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Sellers;
import com.LoginDBUtil;

@WebServlet("/LoginServlet")
public class LoginAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 private LoginDBUtil loginDBUtil;

	    public void init() {
	    	loginDBUtil = new LoginDBUtil();
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        
	        Sellers sellers = new Sellers(username, password);
	        sellers.setUsername(username);
	        sellers.setPassword(password);

	        try {
	            if (loginDBUtil.validate(sellers)) {
	                response.sendRedirect("dashbord.jsp");
	            } else {
	                HttpSession session = request.getSession();
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }

}
