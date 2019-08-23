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
	

	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		
		bookDAO = new BookDAO();
		categoryDAO = new CategoryDAO();
	}

	public void listBooks() throws ServletException, IOException {
		listBooks(null);
	}
	
	public void listBooks(String message) throws ServletException, IOException {
		List<Book> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);

		if(message != null) {
			request.setAttribute("message", message);
		}
			
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
		String title = request.getParameter("title");
		//BookDAO bookDAO = new BookDAO();
		Book existBook = bookDAO.findByTitle(title);
		
		if(existBook != null) {
			String message = "Could not craete new book because the title " +title+ " already exists.";
			listBooks(message);
			return;
		}
		
	
		Book newBook = new Book();
		readBookFields(newBook);
		Book createdBook = 	bookDAO.create(newBook);
		
		if(createdBook.getBookId() > 0) {
			String message = "A new book has been created successfully.";
			listBooks(message);
		}
}

	
	
	public void readBookFields(Book book) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String author= request.getParameter("author");
		String price1 = request.getParameter("price");
		float price =  Float.parseFloat(price1.trim());
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		
		
		
		DateFormat dateFormat = new SimpleDateFormat("MM/DD/YYYY");
		Date publishDate = null;
		try {
				 publishDate = dateFormat.parse(request.getParameter("publishDate"));
		}
		catch(ParseException ex) {
			throw new ServletException("Error parsing publish date (format is mm/dd/yyyy)");
		}
		

		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPublishDate(publishDate);
		
		int categoryId  = Integer.parseInt(request.getParameter("category"));
		Category category = categoryDAO.get(categoryId);
		book.setCategory(category);
		book.setPrice(price);
		Part part = request.getPart("bookImage");
	
		
		
		if(part != null && part.getSize() > 0) {
			long size  = part.getSize();
			byte[] imageBytes = new byte[(int) size];
			
			InputStream  inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			book.setImage(imageBytes);
		}
	}

	
	public void editBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		Book book = bookDAO.get(bookId);
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("book",book);
		request.setAttribute("listCategory",listCategory);
		
		String editPage =  "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}
	
	public void updateBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		Book bookByTitle = bookDAO.findByTitle(title);
		Book existBook = bookDAO.get(bookId);
		
		if(bookByTitle != null && !existBook.equals(bookByTitle)) {
			String message = "Could not update book because there's another book having same title.";
			listBooks(message);
			return;
		}
		
		readBookFields(existBook);
		
		bookDAO.update(existBook);
		
		String message = "The book has been updated successfully";
		listBooks(message);
		
		
	}

	public void deleteBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		
		bookDAO.delete(bookId);
		String message = "The book has been deleted successfully.";
		listBooks(message);
	}

	public void listBooksByCategory() throws ServletException, IOException {
		int categoryId  = Integer.parseInt(request.getParameter("id"));
		List<Book> listBooks = bookDAO.listByCategory(categoryId);
		Category category = categoryDAO.get(categoryId);
		
		
		
		request.setAttribute("listBooks", listBooks);
		request.setAttribute("category", category);
		
		String listPage = "frontend/books_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}

	public void viewBookDetail() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookDAO.get(bookId);
		
		
		
		request.setAttribute("book",book);

		String detailPage = "frontend/book_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
		
		
		
	}

	public void search() throws ServletException, IOException {
		String  keyword = request.getParameter("keyword");
		List<Book> result = null;
		
		if(keyword.equals("")) {
			result = bookDAO.listAll();
		} else {
			result = bookDAO.search(keyword);
		}
		request.setAttribute("result", result);
		request.setAttribute("keyword", keyword);
		
		String resultPage = "frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
	}
}
