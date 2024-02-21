package org.astu.estudent.dbo.table;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Class {
    
    public static String TABLE = "Classes";
    
    public Integer idClass;
    public Integer idCourse;
    public Date    academicYear;
    public String  semester;

    public static Class fromResultSet(ResultSet rSet) throws Exception {
        Class c = new Class();
        c.idClass      = rSet.getInt("idClass");
        c.idCourse     = rSet.getInt("idCourse");
        c.academicYear = rSet.getDate("academicYear");
        c.semester     = rSet.getString("semester");
        return c;
    }
    
    public static void setPrepared(PreparedStatement pStatement, Class c) throws Exception {
        int i = 0;
        pStatement.setInt(++i, c.idClass);
        pStatement.setInt(++i, c.idCourse);
        pStatement.setDate(++i, c.academicYear);
        pStatement.setString(++i, c.semester);
    }
    
}
