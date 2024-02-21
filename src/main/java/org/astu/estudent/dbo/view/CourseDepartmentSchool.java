package org.astu.estudent.dbo.view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseDepartmentSchool {

    public static String TABLE = "ViewCourseDepartmentSchool"; 

    public Integer idCourse;
    public Integer idDepartment;
    public Integer idSchool;
    public String  name;
    public String  shortCode;
    public String  type;
    public String  departmentName;
    public String  departmentShortCode;
    public String  schoolName;
    public String  schoolShortCode;

    public static CourseDepartmentSchool fromResult(ResultSet rSet) throws SQLException {
        CourseDepartmentSchool cDepartmentSchool = new CourseDepartmentSchool();
        cDepartmentSchool.idCourse             = rSet.getInt("idCourse");
        cDepartmentSchool.idDepartment         = rSet.getInt("idDepartment");
        cDepartmentSchool.idSchool             = rSet.getInt("idSchool");
        cDepartmentSchool.name                 = rSet.getString("name");
        cDepartmentSchool.shortCode            = rSet.getString("shortCode");
        cDepartmentSchool.type                 = rSet.getString("type");
        cDepartmentSchool.departmentName       = rSet.getString("departmentName");
        cDepartmentSchool.departmentShortCode  = rSet.getString("departmentShortCode");
        cDepartmentSchool.schoolName           = rSet.getString("schoolName");
        cDepartmentSchool.schoolShortCode      = rSet.getString("schoolShortCode");
        return cDepartmentSchool;
    }
    
    public static void setPrepared(PreparedStatement pStatement, CourseDepartmentSchool cDepartmentSchool) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, cDepartmentSchool.idCourse);
        pStatement.setInt(++i, cDepartmentSchool.idDepartment);
        pStatement.setInt(++i, cDepartmentSchool.idSchool);
        pStatement.setString(++i, cDepartmentSchool.name);
        pStatement.setString(++i, cDepartmentSchool.shortCode);
        pStatement.setString(++i, cDepartmentSchool.type);
        pStatement.setString(++i, cDepartmentSchool.departmentName);
        pStatement.setString(++i, cDepartmentSchool.departmentShortCode);
        pStatement.setString(++i, cDepartmentSchool.schoolName);
        pStatement.setString(++i, cDepartmentSchool.schoolShortCode);
    }
    
}
