package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    try {
	        // Retrieve title and content from request
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        // Replace newline characters with <br> for display later (if needed)
	        String formattedContent = content.replace("\n", "<br>");

	        // Create a new Note object
	        Note note = new Note(title, formattedContent, new Date());

	        // Hibernate session and transaction
	        Session s = FactoryProvider.getFactory().openSession();
	        Transaction t = s.beginTransaction();

	        // Save the note
	        s.save(note);
	        t.commit();
	        s.close();

	        // Display success message
	        out.print("<h1 style='text-align:center;'>Note is added successfully</h1>");
	        out.print("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");

	    } catch (Exception e) {
	        e.printStackTrace();
	        out.print("<h1 style='text-align:center;'>Error occurred while adding the note</h1>");
	    } finally {
	        out.close();
	    }
	}


}
