<%@ page import="java.util.*" %> 
<%@ page import="org.astu.estudent.Site" %> 
<%@ page import="org.astu.estudent.dbo.table.User" %> 
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
<%!

    public String activeLink(String page, HttpServletRequest request) {
        String paramPage = (String)request.getParameter("page");
        return page.equals(paramPage == null ? "Home" : paramPage) ? "active" : "";
    }

    public boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("isLoggedIn") != null;
    }

    public static User getUser(HttpServletRequest request) {
        return (User)request.getSession().getAttribute("user");
    }

%>