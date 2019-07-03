package com.bookwale.controller.frontend;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bookwale.dao.BookDAO;
import com.bookwale.dao.CategoryDAO;
import com.bookwale.entity.Book;
import com.bookwale.entity.Category;

@WebServlet("")
public class HomeServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CategoryDAO categoryDAO = new CategoryDAO();
		BookDAO  bookDAO = new BookDAO();
		
		

		List<Book> listNewBooks = bookDAO.listNewBooks();

		request.setAttribute("listNewBooks", listNewBooks);
		
		String homepage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

}
