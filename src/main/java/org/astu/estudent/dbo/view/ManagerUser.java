package org.astu.estudent.dbo.view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerUser {
    
    public static String TABLE = "ViewManagerUser";
    
    public Integer idUser;
    public Integer idDepartment;
    public String  role;
    public String  type;
    public String  firstName;
    public String  lastName;
    public String  phone;
    public String  email;
    public String  password;

    public static ManagerUser fromResultSet(ResultSet rSet) throws SQLException {
        ManagerUser managerUser  = new ManagerUser();
        managerUser.idUser       = rSet.getInt("idUser");
        managerUser.idDepartment = rSet.getInt("idDepartment");
        managerUser.role         = rSet.getString("role");
        managerUser.type         = rSet.getString("type");
        managerUser.firstName    = rSet.getString("firstName");
        managerUser.lastName     = rSet.getString("lastName");
        managerUser.phone        = rSet.getString("phone");
        managerUser.email        = rSet.getString("email");
        managerUser.password     = rSet.getString("password");
        return managerUser;
    }
    
    public static void setPrepared(PreparedStatement pStatement, ManagerUser managerUser) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, managerUser.idUser);
        pStatement.setInt(++i, managerUser.idDepartment);
        pStatement.setString(++i, managerUser.role);
        pStatement.setString(++i, managerUser.type);
        pStatement.setString(++i, managerUser.firstName);
        pStatement.setString(++i, managerUser.lastName);
        pStatement.setString(++i, managerUser.phone);
        pStatement.setString(++i, managerUser.email);
        pStatement.setString(++i, managerUser.password);
    }
    
}
