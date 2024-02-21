package org.astu.estudent.dbo.table;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Student {
    
    public static String TABLE = "Students";
    
    public Integer idUser;
    public Integer idDepartment;
    public String  id;
    public Date    entryDate;
    public Date    exitDate;

    public static Student fromResultSet(ResultSet rSet) throws SQLException {
        Student student = new Student();
        student.idUser       = rSet.getInt("idUser");
        student.idDepartment = rSet.getInt("idDepartment");
        student.id           = rSet.getString("id");
        student.entryDate    = rSet.getDate("entryDate");
        student.exitDate     = rSet.getDate("exitDate");
        return student;
    }
    
    public static void setPrepared(PreparedStatement pStatement, Student student) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, student.idUser);
        pStatement.setInt(++i, student.idDepartment);
        pStatement.setString(++i, student.id);
        pStatement.setDate(++i, student.entryDate);
        pStatement.setDate(++i, student.exitDate);
    }
    
}
