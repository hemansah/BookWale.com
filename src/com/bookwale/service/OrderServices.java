package com.bookwale.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookwale.controller.frontend.shoppingcart.ShoppingCart;
import com.bookwale.dao.OrderDAO;
import com.bookwale.entity.Book;
import com.bookwale.entity.BookOrder;
import com.bookwale.entity.Customer;
import com.bookwale.entity.OrderDetail;

public class OrderServices {
		
		private OrderDAO orderDAO;
		private HttpServletRequest request;
		private HttpServletResponse response;
		
		public OrderServices(HttpServletRequest request, HttpServletResponse response) {
			this.request = request;
			this.response = response;
			
		}
		
		
		public OrderServices(OrderDAO orderDAO, HttpServletRequest request, HttpServletResponse response) {
			this.request = request;
			this.response = response;
			this.orderDAO = new OrderDAO();
		}


		public void listAllOrder() throws ServletException, IOException {
			List<BookOrder> listOrder = orderDAO.listAll();
			request.setAttribute("listOrder", listOrder);
			
			String listPage = "order_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
			dispatcher.forward(request, response);
		}


		public void viewOrderDetailForAdmin() throws ServletException, IOException {
			Integer	orderId = Integer.parseInt(request.getParameter("id"));
			
			OrderDAO orderDAO = new OrderDAO(); 
			BookOrder order = orderDAO.get(orderId);
			request.setAttribute("order",order);
			
			String detailPage = "order_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
			dispatcher.forward(request,response);
			
		}


		public void showCheckoutForm() throws ServletException, IOException {
			String checkOutPage = "frontend/checkout.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(checkOutPage);
			dispatcher.forward(request,response);
			
		}


		public void placeOrder() throws ServletException, IOException {
			String recipientName = request.getParameter("recipientName");
			String recipientPhone= request.getParameter("recipientPhone");
			String address = request.getParameter("address");
			String city= request.getParameter("city");
			String zipcode= request.getParameter("zipcode");
			String country = request.getParameter("country");
			String paymentMethod  = request.getParameter("paymentMethod");
			String shippingAddress = address + ", "+ city + "," + zipcode + "," +country;
			
			BookOrder order = new BookOrder();
			order.setRecipientName(recipientName);
			order.setRecipientPhone(recipientPhone);
 			order.setShippingAddress(shippingAddress);
 			order.setPaymentMethod(paymentMethod);
 			
 			HttpSession session = request.getSession();
 			 
 			Customer customer  = (Customer) session.getAttribute("loggedCustomer");
			order.setCustomer(customer);
			
			ShoppingCart  shoppingCart = (ShoppingCart) session.getAttribute("cart");
			Map<Book, Integer> items = shoppingCart.getItems();
			
			Iterator<Book> iterator  = items.keySet().iterator();
			
			Set<OrderDetail> orderDetails  = new HashSet<>();
			
			while(iterator.hasNext()) {
				Book book = iterator.next();
				Integer quantity = items.get(book);
				float subtotal = quantity * book.getPrice();
				
				OrderDetail orderDetail =  new OrderDetail();
				
				orderDetail.setBook(book);
				orderDetail.setBookOrder(order);
				orderDetail.setQuantity(quantity);
				orderDetail.setSubtotal(subtotal);
				
				orderDetails.add(orderDetail);
				
			}
			
			order.setOrderDetails(orderDetails);
			order.setTotal(shoppingCart.getTotalAmount());
			OrderDAO orderDAO = new OrderDAO(); 
			orderDAO.create(order);
			
			shoppingCart.clear();
			
			String message = "Thank You ! Your order has been received. We will deliver your books within few days";
			
			request.setAttribute("message", message);
			String messagePage = "frontend/message.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
			dispatcher.forward(request,response);
			
		}
}
