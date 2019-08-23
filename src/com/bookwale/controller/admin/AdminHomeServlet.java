package com.bookwale.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookwale.dao.BookDAO;
import com.bookwale.dao.CustomerDAO;
import com.bookwale.dao.OrderDAO;
import com.bookwale.dao.ReviewDAO;
import com.bookwale.dao.UserDAO;
import com.bookwale.entity.BookOrder;
import com.bookwale.entity.Review;


@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminHomeServlet() {
        super();
        
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDAO orderDAO = new OrderDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
		UserDAO userDAO = new UserDAO();
		BookDAO bookDAO = new BookDAO();
		CustomerDAO customerDAO = new CustomerDAO();
		
		List<BookOrder> listMostRecentSales = orderDAO.listMostRecentSales();
		List<Review> listMostRecentReviews = reviewDAO.listMostRecent();
		
		long totalUsers=  userDAO.count();
		long totalBooks = bookDAO.count();
		long totalCustomers = customerDAO.count();
		long totalReviews = reviewDAO.count();
		long totalOrders = orderDAO.count();
		
		
		request.setAttribute("listMostRecentSales",listMostRecentSales);
		request.setAttribute("listMostRecentReviews",listMostRecentReviews);
		request.setAttribute("totalUsers",totalUsers);
		request.setAttribute("totalBooks",totalBooks);
		request.setAttribute("totalCustomers",totalCustomers);
		request.setAttribute("totalReviews",totalReviews);
		request.setAttribute("totalOrders",totalOrders);
		
		String homepage = "index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

	

}
