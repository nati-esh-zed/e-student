package org.astu.estudent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.astu.estudent.Site;
import org.astu.estudent.dbo.ConnectionManager;
import org.astu.estudent.dbo.table.User;
import org.astu.estudent.dbo.view.ManagerUser;
import org.astu.estudent.dbo.view.FullManager;

@WebServlet("/Login")
public class Login extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
    {
        try {
            String email    = (String)request.getParameter("email");
            String password = (String)request.getParameter("password");
            HttpSession session = request.getSession();
            if(session.getAttribute("isLoggedIn") != null) {
                request.getRequestDispatcher(Site.ROOT+"?page=Home").forward(request, response);
            } else {
                ConnectionManager man = new ConnectionManager();
                String sql1 = String.format("SELECT * FROM `%s` WHERE `email`=? AND `password`=? LIMIT 1", User.TABLE);
                String sql2 = String.format("SELECT * FROM `%s` WHERE `IdUser`=? LIMIT 1", FullManager.TABLE);
                try(Connection con = man.getConnection();
                    PreparedStatement pst1 = con.prepareStatement(sql1); 
                    PreparedStatement pst2 = con.prepareStatement(sql2);
                ) {
                    ResultSet rSet;
                    pst1.setString(1, email);
                    pst1.setString(2, password);
                    rSet = pst1.executeQuery();
                    if(rSet.next()) {
                        User user = User.fromResultSet(rSet);
                        session.setAttribute("user", user);
                        if(user.type.equals("manager")) {
                            pst2.setInt(1, user.idUser);
                            ResultSet rSet2 = pst2.executeQuery();
                            if(rSet2.next()) {
                                ManagerUser managerUser = ManagerUser.fromResultSet(rSet2);
                                FullManager fullManager = FullManager.fromResultSet(rSet2);
                                session.setAttribute("managerUser", managerUser);
                                session.setAttribute("fullManager", fullManager);
                            }
                        }
                        session.setAttribute("isLoggedIn", true);
                        response.sendRedirect("?page=Home");
                        return;
                    } else {
                        session.setAttribute("error", "Invalid email or password!");
                    }
                }
            }
            response.sendRedirect("?page=Login");
            // request.getRequestDispatcher("/?page=Login").forward(request, response);;
        }
        catch(Exception ex) { 
            try (PrintWriter pw = response.getWriter()) {
                ex.printStackTrace(pw); 
            }
        }
    }
    
}
