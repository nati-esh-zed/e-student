package org.astu.estudent.dbo.view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DepartmentSchool {

    public static String TABLE = "ViewDepartmentSchool"; 

    public Integer idDepartment;
    public Integer idSchool;
    public String  departmentName;
    public String  departmentShortCode;
    public String  schoolName;
    public String  schoolShortCode;

    public static DepartmentSchool fromResult(ResultSet rSet) throws SQLException {
        DepartmentSchool dSchool     = new DepartmentSchool();
        dSchool.idDepartment         = rSet.getInt("idDepartment");
        dSchool.idSchool             = rSet.getInt("idSchool");
        dSchool.departmentName       = rSet.getString("departmentName");
        dSchool.departmentShortCode  = rSet.getString("departmentShortCode");
        dSchool.schoolName           = rSet.getString("schoolName");
        dSchool.schoolShortCode      = rSet.getString("schoolShortCode");
        return dSchool;
    }
    
    public static void setPrepared(PreparedStatement pStatement, DepartmentSchool dSchool) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, dSchool.idDepartment);
        pStatement.setInt(++i, dSchool.idSchool);
        pStatement.setString(++i, dSchool.departmentName);
        pStatement.setString(++i, dSchool.departmentShortCode);
        pStatement.setString(++i, dSchool.schoolName);
        pStatement.setString(++i, dSchool.schoolShortCode);
    }
    
}
