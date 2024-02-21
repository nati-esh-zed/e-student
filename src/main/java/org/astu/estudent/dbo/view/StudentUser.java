package org.astu.estudent.dbo.view;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentUser {
    
    public static String TABLE = "ViewStudentUser";
    
    public Integer idUser;
    public Integer idDepartment;
    public String  type;
    public String  firstName;
    public String  lastName;
    public String  phone;
    public String  email;
    public String  password;
    public String  id;
    public Date    entryDate;
    public Date    exitDate;

    public static StudentUser fromResultSet(ResultSet rSet) throws SQLException {
        StudentUser studentUser  = new StudentUser();
        studentUser.idUser       = rSet.getInt("idUser");
        studentUser.idDepartment = rSet.getInt("idDepartment");
        studentUser.type         = rSet.getString("type");
        studentUser.firstName    = rSet.getString("firstName");
        studentUser.lastName     = rSet.getString("lastName");
        studentUser.phone        = rSet.getString("phone");
        studentUser.email        = rSet.getString("email");
        studentUser.password     = rSet.getString("password");
        studentUser.id           = rSet.getString("id");
        studentUser.entryDate    = rSet.getDate("entryDate");
        studentUser.exitDate     = rSet.getDate("exitDate");
        return studentUser;
    }
    
    public static void setPrepared(PreparedStatement pStatement, StudentUser studentUser) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, studentUser.idUser);
        pStatement.setInt(++i, studentUser.idDepartment);
        pStatement.setString(++i, studentUser.type);
        pStatement.setString(++i, studentUser.firstName);
        pStatement.setString(++i, studentUser.lastName);
        pStatement.setString(++i, studentUser.phone);
        pStatement.setString(++i, studentUser.email);
        pStatement.setString(++i, studentUser.password);
        pStatement.setString(++i, studentUser.id);
        pStatement.setDate(++i, studentUser.entryDate);
        pStatement.setDate(++i, studentUser.exitDate);
    }
    
}
