package com.bookwale.controller.admin.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookwale.service.OrderServices;

@WebServlet("/admin/list_order")
public class ListOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListOrderServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OrderServices  orderServices = new OrderServices(null, request, response);
		orderServices.listAllOrder();
	}

}
