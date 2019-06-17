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

import com.bookwale.dao.CategoryDAO;
import com.bookwale.entity.Category;

public class CategoryServices {

	private HttpServletRequest request;
	private HttpServletResponse response;

	private CategoryDAO categoryDAO;
	private EntityManager entityManager;

	public CategoryServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;

		categoryDAO = new CategoryDAO(entityManager);
	}

	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}
	
	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		if(message != null) {
			request.setAttribute("message",message);
		}
		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(name);

		if (existCategory != null) {
			String message = "Could not create category," + "A category with same name already exists";
			request.setAttribute("message", message);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Category newCategory = new Category();
			categoryDAO.create(newCategory);
			String message = "New category created successfully.";
			listCategory(message);
		}
	}

}
