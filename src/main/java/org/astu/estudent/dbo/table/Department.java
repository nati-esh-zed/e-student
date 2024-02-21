package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Department {
    
    public static String TABLE = "Departments";
    
    public Integer idDepartment;
    public Integer idSchool;
    public String  name;
    public String  shortCode;

    public static Department fromResultSet(ResultSet rSet) throws SQLException {
        Department department = new Department();
        department.idDepartment = rSet.getInt("idDepartment");
        department.idSchool     = rSet.getInt("idSchool");
        department.name         = rSet.getString("name");
        department.shortCode    = rSet.getString("shortCode");
        return department;
    }
    
    public static void setPrepared(PreparedStatement pStatement, Department department) throws SQLException {
        pStatement.setInt(1, department.idDepartment);
        pStatement.setInt(2, department.idSchool);
        pStatement.setString(3, department.name);
        pStatement.setString(4, department.shortCode);
    }
    
}
