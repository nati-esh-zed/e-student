package org.astu.estudent.dbo.view;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerUserDepartmentSchool {

    public static String TABLE = "ViewManagerUserDepartmentSchool"; 

    public Integer idUser;
    public Integer idDepartment;
    public Integer idSchool;
    public String  type;
    public String  firstName;
    public String  lastName;
    public String  phone;
    public String  email;
    public String  password;
    public String  role;
    public String  departmentName;
    public String  departmentShortCode;
    public String  schoolName;
    public String  schoolShortCode;

    public static ManagerUserDepartmentSchool fromResult(ResultSet rSet) throws SQLException {
        ManagerUserDepartmentSchool mUserDepartmentSchool = new ManagerUserDepartmentSchool();
        mUserDepartmentSchool.idUser              = rSet.getInt("idUser");
        mUserDepartmentSchool.idDepartment        = rSet.getInt("idDepartment");
        mUserDepartmentSchool.idSchool            = rSet.getInt("idSchool");
        mUserDepartmentSchool.type                = rSet.getString ("type");
        mUserDepartmentSchool.firstName           = rSet.getString ("firstName");
        mUserDepartmentSchool.lastName            = rSet.getString ("lastName");
        mUserDepartmentSchool.phone               = rSet.getString ("phone");
        mUserDepartmentSchool.email               = rSet.getString ("email");
        mUserDepartmentSchool.password            = rSet.getString ("password");
        mUserDepartmentSchool.role                = rSet.getString ("role");
        mUserDepartmentSchool.departmentName      = rSet.getString ("departmentName");
        mUserDepartmentSchool.departmentShortCode = rSet.getString ("departmentShortCode");
        mUserDepartmentSchool.schoolName          = rSet.getString ("schoolName");
        mUserDepartmentSchool.schoolShortCode     = rSet.getString ("schoolShortCode");
        return mUserDepartmentSchool;
    }
    
    public static void setPrepared(PreparedStatement pStatement, ManagerUserDepartmentSchool mUserDepartmentSchool) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, mUserDepartmentSchool.idUser);
        pStatement.setInt(++i, mUserDepartmentSchool.idDepartment);
        pStatement.setInt(++i, mUserDepartmentSchool.idSchool);
        pStatement.setString(++i, mUserDepartmentSchool.type);
        pStatement.setString(++i, mUserDepartmentSchool.firstName);
        pStatement.setString(++i, mUserDepartmentSchool.lastName);
        pStatement.setString(++i, mUserDepartmentSchool.phone);
        pStatement.setString(++i, mUserDepartmentSchool.email);
        pStatement.setString(++i, mUserDepartmentSchool.password);
        pStatement.setString(++i, mUserDepartmentSchool.role);
        pStatement.setString(++i, mUserDepartmentSchool.departmentName);
        pStatement.setString(++i, mUserDepartmentSchool.departmentShortCode);
        pStatement.setString(++i, mUserDepartmentSchool.schoolName);
        pStatement.setString(++i, mUserDepartmentSchool.schoolShortCode);

    }
    
}
