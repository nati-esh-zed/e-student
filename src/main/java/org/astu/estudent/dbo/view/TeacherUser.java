package org.astu.estudent.dbo.view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherUser {
    
    public static String TABLE = "ViewTeacherUser";
    
    public Integer idUser;
    public Integer idDepartment;
    public String  role;
    public String  type;
    public String  firstName;
    public String  lastName;
    public String  phone;
    public String  email;
    public String  password;


    public static TeacherUser fromResultSet(ResultSet rSet) throws SQLException {
        TeacherUser teacherUser  = new TeacherUser();
        teacherUser.idUser       = rSet.getInt("idUser");
        teacherUser.idDepartment = rSet.getInt("idDepartment");
        teacherUser.role         = rSet.getString("role");
        teacherUser.type         = rSet.getString("type");
        teacherUser.firstName    = rSet.getString("firstName");
        teacherUser.lastName     = rSet.getString("lastName");
        teacherUser.phone        = rSet.getString("phone");
        teacherUser.email        = rSet.getString("email");
        teacherUser.password     = rSet.getString("password");
        return teacherUser;
    }
    
    public static void setPrepared(PreparedStatement pStatement, TeacherUser teacherUser) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, teacherUser.idUser);
        pStatement.setInt(++i, teacherUser.idDepartment);
        pStatement.setString(++i, teacherUser.role);
        pStatement.setString(++i, teacherUser.type);
        pStatement.setString(++i, teacherUser.firstName);
        pStatement.setString(++i, teacherUser.lastName);
        pStatement.setString(++i, teacherUser.phone);
        pStatement.setString(++i, teacherUser.email);
        pStatement.setString(++i, teacherUser.password);
    }
    
}
