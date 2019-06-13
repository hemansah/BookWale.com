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

import com.bookwale.dao.UserDAO;
import com.bookwale.entity.Users;

public class UserServices {
	private UserDAO userDAO;
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	
	public  UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		
		entityManagerFactory = Persistence.createEntityManagerFactory("bookwale");
		entityManager  = entityManagerFactory.createEntityManager(); 
		userDAO  = new UserDAO(entityManager);
		
	}
	
	public void listUser()
			throws ServletException, IOException {
		listUser(null);
	}
	
	
	public void listUser(String message)throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();
		request.setAttribute("listUsers", listUsers);
		if(message != null){
		request.setAttribute("message", message);
		}String listPage= "user_list.jsp";
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
} 
