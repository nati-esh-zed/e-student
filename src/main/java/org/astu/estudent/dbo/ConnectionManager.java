package org.astu.estudent.dbo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {

    public ConnectionManager() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
    }

    public Connection getConnection() throws Exception {
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/estudent",  
            "estudentApp", "EStudentApp@4321");
    }

}
