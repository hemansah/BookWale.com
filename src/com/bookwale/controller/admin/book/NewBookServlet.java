package com.bookwale.controller.admin.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookwale.controller.BaseServlet;
import com.bookwale.service.BookServices;

@WebServlet("/admin/new_book")
public class NewBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public NewBookServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.showBookNewForm();
	}

}
