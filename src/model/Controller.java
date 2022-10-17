package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String targetView = "/WordCrypt_Gage/index.jsp";
		if (request.getParameter("action") != null && request.getParameter("action").equals("Contact")) {
			targetView = "/WordCrypt_Gage/contact.jsp";
		}
		if (request.getParameter("action") != null && request.getParameter("action").equals("About")) {
			targetView = "/WordCrypt_Gage/about.html";
		}
		if (request.getParameter("action") != null && request.getParameter("action").equals("Info")) {
			targetView = "/WordCrypt_Gage/info.html";
		}
		if (request.getParameter("action") != null && request.getParameter("action").equals("Index")) {
			targetView = "/WordCrypt_Gage/index.jsp";
		}
		RequestDispatcher requestDispatch = getServletContext().getRequestDispatcher(targetView);
		requestDispatch.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
