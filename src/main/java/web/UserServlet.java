package web;

import DAO.UserDAO;
import model.User;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.*;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private UserDAO userDAO;
	
    public UserServlet() {
        this.userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getServletPath();
		
		try {
		switch (action) {
		case "/new": 
			showNewForm(request, response);
			break;
		case "/insert": 
			insertUser(request, response);
			break;
		case "/delete": 
			deleteUser(request, response);
			break;
		case "/edit": 
			showEditForm(request, response);
			break;
		case "/update": 
			updateUser(request, response);
			break;
		default: 
			listUser(request, response);
			break;
		}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	 private void listUser(HttpServletRequest request, HttpServletResponse response)
			    throws SQLException, IOException, ServletException {
			        List <User> listUser = userDAO.selectAllUsers();
			        request.setAttribute("listUser", listUser);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
			        dispatcher.forward(request, response);
			    }

	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDAO.selectUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		int age = Integer.parseInt(request.getParameter("age"));

		User book = new User(id, name, surname, age);
		userDAO.updateUser(book);
		response.sendRedirect("list");
	}
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		int age = Integer.parseInt(request.getParameter("age"));
		User newUser = new User(name, surname, age);
		userDAO.insertUser(newUser);
		response.sendRedirect("list");
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteUser(id);
		response.sendRedirect("list");
	}
}
