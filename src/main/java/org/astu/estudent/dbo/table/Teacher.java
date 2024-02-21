package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Teacher {
    
    public static String TABLE = "Teachers";
    
    public Integer idUser;
    public String  role;

    public static Teacher fromResultSet(ResultSet rSet) throws SQLException {
        Teacher teacher = new Teacher();
        teacher.idUser       = rSet.getInt("idUser");
        teacher.role         = rSet.getString("role");
        return teacher;
    }
    
    public static void setPrepared(PreparedStatement pStatement, Teacher teacher) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, teacher.idUser);
        pStatement.setString(++i, teacher.role);
    }
    
}
