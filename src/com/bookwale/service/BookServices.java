package com.bookwale.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookwale.dao.BookDAO;
import com.bookwale.entity.Book;;

public class BookServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDAO bookDAO;
	private EntityManager entityManager;
	
	
	public BookServices( EntityManager entityManager,HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;
		bookDAO = new BookDAO(entityManager);
	}


	public void listBooks() throws ServletException, IOException {
		List<Book> listBooks =  bookDAO.listAll();
		request.setAttribute("listBooks",listBooks);
		
		String listPage = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	
	}
}
