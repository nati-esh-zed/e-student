package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class School {
    
    public static String TABLE = "Schools";
    
    public Integer idSchool;
    public String  name;
    public String  shortCode;

    public static School fromResultSet(ResultSet rSet) throws SQLException {
        School school = new School();
        school.idSchool     = rSet.getInt("idSchool");
        school.name         = rSet.getString("name");
        school.shortCode    = rSet.getString("shortCode");
        return school;
    }
    
    public static void setPrepared(PreparedStatement pStatement, School school) throws SQLException {
        pStatement.setInt(1, school.idSchool);
        pStatement.setString(2, school.name);
        pStatement.setString(3, school.shortCode);
    }
    
}
