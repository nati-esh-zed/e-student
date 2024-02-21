package org.astu.estudent.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/IncludePage")
public class IncludePage extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
    {
        String page = (String)request.getParameter("page");
        if(page != null) {
            page = page.replace(".", "/");
            try {
                request.getRequestDispatcher("pages/"+page+".jsp").include(request, response);
            } catch(ServletException ex) {
                request.getRequestDispatcher("pages/404.jsp").include(request, response);
            }
        }
        else 
            request.getRequestDispatcher("pages/Home.jsp").include(request, response);
    }
    
}
