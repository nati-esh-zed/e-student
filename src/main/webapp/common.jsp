<%@ page import="java.util.ArrayList" %> 
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
<%@ page import="org.astu.estudent.Server" %> 
<%@ page import="org.astu.estudent.dbo.table.User" %> 
<%

Object loggedIn = request.getSession().getAttribute("loggedIn");
User   user     = (User)request.getSession().getAttribute("user");

%>
<%!

String activeLink(String page, HttpServletRequest request) {
    String paramPage = (String)request.getParameter("page");
    return page.equals(paramPage == null ? "Home" : paramPage) ? "active" : "";
}

%>