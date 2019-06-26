package com.bookwale.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookwale.dao.BookDAO;
import com.bookwale.dao.CategoryDAO;
import com.bookwale.entity.Book;
import com.bookwale.entity.Category;;

public class BookServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDAO categoryDAO;
	private BookDAO bookDAO;
	private EntityManager entityManager;

	public BookServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.entityManager = entityManager;
		bookDAO = new BookDAO(entityManager);
		categoryDAO = new CategoryDAO(entityManager);
	}

	public void listBooks() throws ServletException, IOException {
		List<Book> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);

		String listPage = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}

	public void showBookNewForm() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);

		String newPage = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);

	}

	public void createBook() throws ServletException, IOException {
		Integer categoryId  = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String author= request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		
		DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
		Date publishDate = null;
		try {
				 publishDate = dateFormat.parse(request.getParameter("publishDate"));
		}
		catch(ParseException ex) {
			throw new ServletException("Error parsing publish date (format is mm/dd/yyyy)");
		}
		
		System.out.println("cat : " +categoryId);
		System.out.println("title : "+title);
		System.out.println("author : "+author);
		System.out.println("desc : "+description);
		System.out.println("isbn : "+isbn);
		System.out.println("price : "+price);
		System.out.println("date : "+publishDate);
		
		Book newBook = new Book();
		newBook.setTitle(title);
		newBook.setAuthor(author);
		newBook.setDescription(description);
		newBook.setIsbn(isbn);
		newBook.setPublishDate(publishDate);
		Category category = categoryDAO.get(categoryId);
		
		newBook.setCategory(category);
		newBook.setPrice(price);
		Part part = request.getPart("bookImage");
		
		if(part != null && part.getSize() > 0) {
			long size  = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			
			InputStream  inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			newBook.setImage(imageBytes);
		}
		
		Book createdBook = 	bookDAO.create(newBook);
		
		if(createdBook.getBookId() > 0) {
			String message = "A new has been created successfully.";
			request.setAttribute("message", message);
			listBooks();
		}
}
}
