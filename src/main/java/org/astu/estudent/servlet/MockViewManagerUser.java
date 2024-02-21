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
import org.astu.estudent.dbo.view.ManagerUser;

@WebServlet("/MockViewManagerUser")
public class MockViewManagerUser extends HttpServlet {
    
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
                rSet = st.executeQuery(String.format("SELECT COUNT(*) FROM `%s`", ManagerUser.TABLE));
                rSet.next();
                int usersCount = rSet.getInt(1);
                // get data 
                ArrayList<ManagerUser> managerUsers = new ArrayList<>(usersCount);
                rSet = st.executeQuery(String.format("SELECT * FROM `%s` LIMIT 0, 100", ManagerUser.TABLE));
                for(int i = 0; rSet.next(); i++)
                    managerUsers.add(i, ManagerUser.fromResultSet(rSet));
                // pass data through session
                session.setAttribute("managerUsers", managerUsers);
            }
            session.setAttribute("activePage", "ListViewManagerUser");
            request.getRequestDispatcher("").forward(request, response);
        }
        catch(Exception ex) { 
            try (PrintWriter pw = response.getWriter()) {
                ex.printStackTrace(pw); 
            }
        }
    }
    
}
