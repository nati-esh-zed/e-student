package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Course {
    
    public static String TABLE = "Courses";
    
    public Integer idCourse;
    public Integer idDepartment;
    public String  name;
    public String  shortCode;
    public String  type;

    public static Course fromResultSet(ResultSet rSet) throws Exception {
        Course c = new Course();
        c.idCourse     = rSet.getInt("idCourse");
        c.idDepartment = rSet.getInt("idDepartment");
        c.name         = rSet.getString("name");
        c.shortCode    = rSet.getString("shortCode");
        c.type         = rSet.getString("type");
        return c;
    }
    
    public static void setPrepared(PreparedStatement pStatement, Course c) throws Exception {
        int i = 0;
        pStatement.setInt(++i, c.idCourse);
        pStatement.setInt(++i, c.idDepartment);
        pStatement.setString(++i, c.name);
        pStatement.setString(++i, c.shortCode);
        pStatement.setString(++i, c.type);
    }
    
}
