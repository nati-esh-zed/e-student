package org.astu.estudent.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.astu.estudent.Site;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
    {
        try {
            HttpSession session = request.getSession();
            session.invalidate();
        }
        catch(Exception ex) { 
            try (PrintWriter pw = response.getWriter()) {
                ex.printStackTrace(pw); 
            }
        }
        response.sendRedirect(Site.ROOT);
    }
    
}
