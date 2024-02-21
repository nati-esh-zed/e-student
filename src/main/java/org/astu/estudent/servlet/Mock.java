package org.astu.estudent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.astu.estudent.dbo.ConnectionManager;

// @WebServlet("/Mock")
public class Mock extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException
    {
        try {
            ConnectionManager man = new ConnectionManager();
            try(Connection con = man.getConnection();
                Statement st = con.createStatement()) 
            {
                String table = (String)request.getParameter("table");
                if(table != null) {
                    ResultSet rSet;
                    rSet = st.executeQuery(String.format("SELECT * FROM `%s` LIMIT 0, 100", table));
                    ResultSetMetaData md = rSet.getMetaData();
                    try (PrintWriter pw = response.getWriter()) {
                        pw.println(table);
                        pw.println("-------------------------------");
                        for(int i = 0; i < md.getColumnCount(); i++) {
                            pw.print(md.getColumnLabel(i+1)+"  ");
                        }
                        pw.println();
                        while(rSet.next()) {
                            for(int i = 0; i < md.getColumnCount(); i++) {
                                pw.print(rSet.getString(i+1)+"  ");
                            }
                            pw.println();
                        }
                    }
                } else {
                    throw new Exception("parameter `table` must not be null");
                }
            }
        }
        catch(Exception ex) { 
            try (PrintWriter pw = response.getWriter()) {
                ex.printStackTrace(pw); 
            }
        }
    }
    
}
