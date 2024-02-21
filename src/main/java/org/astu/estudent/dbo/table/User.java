package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    
    public static String TABLE = "Users";
    
    public Integer idUser;
    public String  type;
    public String  firstName;
    public String  lastName;
    public String  phone;
    public String  email;
    public String  password;

    public static User fromResultSet(ResultSet rSet) throws SQLException {
        User user = new User();
        user.idUser    = rSet.getInt("idUser");
        user.type      = rSet.getString("type");
        user.firstName = rSet.getString("firstName");
        user.lastName  = rSet.getString("lastName");
        user.phone     = rSet.getString("phone");
        user.email     = rSet.getString("email");
        user.password  = rSet.getString("password");
        return user;
    }
    
    public static void setPrepared(PreparedStatement pStatement, User user) throws SQLException {
        pStatement.setInt(1, user.idUser);
        pStatement.setString(2, user.type);
        pStatement.setString(3, user.firstName);
        pStatement.setString(4, user.lastName);
        pStatement.setString(5, user.phone);
        pStatement.setString(6, user.email);
        pStatement.setString(7, user.password);
    }
    
}
