package com.bookwale.controller.admin.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookwale.service.OrderServices;

@WebServlet("/admin/view_order")
public class ViewOrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewOrderDetailsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.viewOrderDetailForAdmin();
	}

}
