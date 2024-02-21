package org.astu.estudent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.astu.estudent.dbo.*;
import org.astu.estudent.dbo.table.User;

@WebServlet("/Test")
public class Test extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        try {
            ConnectionManager man = new ConnectionManager();
            try(Connection con = man.getConnection();
                Statement st = con.createStatement()) 
            {
                ResultSet rSet;
                // get data count
                rSet = st.executeQuery(String.format("SELECT COUNT(*) FROM `%s`", User.TABLE));
                rSet.next();
                int usersCount = rSet.getInt(1);
                // get data 
                ArrayList<User> users = new ArrayList<>(usersCount);
                rSet = st.executeQuery(String.format("SELECT * FROM `%s` LIMIT 0, 100", User.TABLE));
                for(int i = 0; rSet.next(); i++)
                    users.add(i, User.fromResultSet(rSet));
                // pass data through session
                session.setAttribute("users", users);
            }
            session.setAttribute("activePage", "ListUsers");
            request.getRequestDispatcher("").forward(request, response);
        }
        catch(Exception ex) { 
            try (PrintWriter pw = response.getWriter()) {
                ex.printStackTrace(pw); 
            }
        }
    }
    
}
