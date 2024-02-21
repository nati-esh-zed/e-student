<%@ page import="java.util.*" %> 
<%@ page import="org.astu.estudent.Site" %> 
<%@ page import="org.astu.estudent.dbo.table.*" %> 
<%@ page import="org.astu.estudent.dbo.view.*" %> 
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
<%!

    String activeLink(String page, HttpServletRequest request) {
        String paramPage = (String)request.getParameter("page");
        return page.equals(paramPage == null ? "Home" : paramPage) ? "active" : "";
    }

    boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("isLoggedIn") != null;
    }

    User getUser(HttpServletRequest request) {
        return (User)request.getSession().getAttribute("user");
    }

    FullManager getFullManager(HttpServletRequest request) {
        return (FullManager)request.getSession().getAttribute("fullManager");
    }
    
    ManagerUser getManagerUser(HttpServletRequest request) {
        return (ManagerUser)request.getSession().getAttribute("managerUser");
    }

%>

<%-- if invalid loggin state invalidate session --%>
<% if(isLoggedIn(request) && getUser(request) == null) { session.invalidate(); } %>
