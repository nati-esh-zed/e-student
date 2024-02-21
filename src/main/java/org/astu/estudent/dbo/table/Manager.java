package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Manager {
    
    public static String TABLE = "Managers";
    
    public Integer idUser;
    public Integer idDepartment;
    public String  role;

    public static Manager fromResultSet(ResultSet rSet) throws SQLException {
        Manager manager = new Manager();
        manager.idUser       = rSet.getInt("idUser");
        manager.idDepartment = rSet.getInt("idDepartment");
        manager.role         = rSet.getString("role");
        return manager;
    }
    
    public static void setPrepared(PreparedStatement pStatement, Manager manager) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, manager.idUser);
        pStatement.setInt(++i, manager.idDepartment);
        pStatement.setString(++i, manager.role);
    }
    
}
