package org.astu.estudent.servlet.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.astu.estudent.Site;
import org.astu.estudent.dbo.ConnectionManager;

@WebServlet("/teacher.Register")
public class Register extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
    {
        try {
            String  firstName = (String)request.getParameter("firstName");
            String  lastName  = (String)request.getParameter("lastName");
            String  phone     = (String)request.getParameter("phone");
            String  email     = (String)request.getParameter("email");
            String  password  = (String)request.getParameter("password");
            String  role      = (String)request.getParameter("role");
            // CALL `estudent`.`NewTeacher`(idUser, firstName, lastName, phone, email, password, role);
            String sql = "CALL `NewTeacher`(null, ?, ?, ?, ?, ?, ?)";
            ConnectionManager man = new ConnectionManager();
            try(Connection con = man.getConnection();
                CallableStatement cst = con.prepareCall(sql);
            ) {
                int i = 0;
                cst.setString(++i, firstName);
                cst.setString(++i, lastName);
                cst.setString(++i, phone);
                cst.setString(++i, email);
                cst.setString(++i, password);
                cst.setString(++i, role);
                cst.execute();
                request.getSession().setAttribute("success", "Teacher registered successfully!");
            }
        }
        catch(Exception ex) { 
            request.getSession().setAttribute("error", ex.getMessage());
            // try (PrintWriter pw = response.getWriter()) {
            //     ex.printStackTrace(pw); 
            // }
        }
        response.sendRedirect(Site.ROOT+"?page=teacher.Register");
    }
    
}
