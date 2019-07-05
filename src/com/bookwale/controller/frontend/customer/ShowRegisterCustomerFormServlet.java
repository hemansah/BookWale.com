package com.bookwale.controller.frontend.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ShowCustomerRegisterFormServlet", urlPatterns = { "/register" })
public class ShowRegisterCustomerFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowRegisterCustomerFormServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String registerForm = "frontend/register_form.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(registerForm);
			requestDispatcher.forward(request, response);
	}

}