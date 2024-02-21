package org.astu.estudent.dbo.table;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentClass {
    
    public static String TABLE = "StudentClasses";
    
    public Integer idStudentClass;
    public Integer idStudent;
    public Integer idClass;
    public String  status;
    public String  classBuilding;
    public String  classRoom;
    public Double  attendance;
    public Double  quizGrade;
    public Double  midGrade;
    public Double  finalGrade;
    public Double  assignmentGrade;
    public Double  projectGrade;

    public static StudentClass fromResultSet(ResultSet rSet) throws SQLException {
        StudentClass sClass = new StudentClass();
        sClass.idStudentClass   = rSet.getInt("idStudentClass");
        sClass.idStudent        = rSet.getInt("idStudent");
        sClass.idClass          = rSet.getInt("idClass");
        sClass.status           = rSet.getString("status");
        sClass.classBuilding    = rSet.getString("classBuilding");
        sClass.classRoom        = rSet.getString("classRoom");
        sClass.attendance       = rSet.getDouble("attendance");
        sClass.quizGrade        = rSet.getDouble("quizGrade");
        sClass.midGrade         = rSet.getDouble("midGrade");
        sClass.finalGrade       = rSet.getDouble("finalGrade");
        sClass.assignmentGrade  = rSet.getDouble("assignmentGrade");
        sClass.projectGrade     = rSet.getDouble("projectGrade");
        return sClass;
    }
    
    public static void setPrepared(PreparedStatement pStatement, StudentClass sClass) throws SQLException {
        int i = 0;
        pStatement.setInt(++i, sClass.idStudentClass);
        pStatement.setInt(++i, sClass.idStudent);
        pStatement.setInt(++i, sClass.idClass);
        pStatement.setString(++i, sClass.status);
        pStatement.setString(++i, sClass.classBuilding);
        pStatement.setString(++i, sClass.classRoom);
        pStatement.setDouble(++i, sClass.attendance);
        pStatement.setDouble(++i, sClass.quizGrade);
        pStatement.setDouble(++i, sClass.midGrade);
        pStatement.setDouble(++i, sClass.finalGrade);
        pStatement.setDouble(++i, sClass.assignmentGrade);
        pStatement.setDouble(++i, sClass.projectGrade);
    }
    
}
