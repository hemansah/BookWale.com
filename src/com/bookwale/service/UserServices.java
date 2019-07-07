package com.bookwale.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookwale.dao.HashGenerator;

import com.bookwale.dao.UserDAO;
import com.bookwale.entity.Users;

import net.bytebuddy.utility.privilege.GetSystemPropertyAction;

public class UserServices {
	private UserDAO userDAO;
	
	private HttpServletRequest request;
	private HttpServletResponse response;

	
	
	
	
	public  UserServices(HttpServletRequest request, HttpServletResponse response) {
		
		this.request = request;
		this.response = response;
		userDAO  = new UserDAO();
		
	}
	
	public void listUser()
			throws ServletException, IOException {
			listUser(null);
	}
	
	
	public void listUser(String message)
			throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();
		request.setAttribute("listUsers", listUsers);
		
		if(message != null){
		request.setAttribute("message", message);
		}
		
		String listPage= "user_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void createUser() throws ServletException, IOException {
		String email  = request.getParameter("email");
		String fullname  = request.getParameter("fullname");
		String password  = request.getParameter("password");
		
		Users existUser = userDAO.findByEmail(email);
		if(existUser != null) {
			String message = "Can't create new user. A user with this email '" +email+ "' already exists";
			request.setAttribute("message",message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		}
		else {
			Users newUser = new Users(email, fullname, password);
			userDAO.create(newUser);
			listUser("New user created successfully");
		}
		
		
	}

	public void editUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		Users user = userDAO.get(userId);
		
		String editPage = "user_form.jsp";
		
		if (user == null) {
			editPage = "message.jsp";
			String errorMessage = "Could not find user with ID " + userId;
			request.setAttribute("message", errorMessage);
		} else {
			// set password as null to make the password is left blank by default
			// if left blank, the user's password won't be updated
			// this is to work with the encrypted password feature
			user.setPassword(null);
			request.setAttribute("user", user);			
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}

	public void updateUser() throws ServletException, IOException  {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users userById = userDAO.get(userId);
		
		Users userByEmail = userDAO.findByEmail(email);
		if(userByEmail != null &&  userByEmail.getUserId() != userById.getUserId()) {
			String message = "User with same email already exists.";
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		}else {
			userById.setEmail(email);
			userById.setFullName(fullName);
			
			if (password != null & !password.isEmpty()) {
				String encryptedPassword = HashGenerator.generateMD5(password);
				userById.setPassword(encryptedPassword);
			}
			
			userDAO.update(userById);

			String message = "User has been updated successfully";
			listUser(message);
		}
		}
		


	public void deleteUser() throws ServletException, IOException {
int userId = Integer.parseInt(request.getParameter("id"));
		
		String message = "User has been deleted successfully";
		
		if (userId == 1) {
			message = "The default admin user account cannot be deleted.";
			
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			return;
		}
		
		Users user = userDAO.get(userId);		
		
		if (user == null) {
			message = "Could not find user with ID " + userId
					+ ", or it might have been deleted by another admin";
			
			request.setAttribute("message", message);
			request.getRequestDispatcher("message.jsp").forward(request, response);			
		} else {
			userDAO.delete(userId);
			listUser(message);
		}
		
	}
	
	public void login() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean loginResult = userDAO .checkLogin(email, password);
		
		if(loginResult) {
			request.getSession().setAttribute("useremail",email);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin/");
			requestDispatcher.forward(request, response);
		}else { 
			String message = "Login failed!";
			request.setAttribute("message",message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);

			
		}
	}
} 
