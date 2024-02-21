<%@ include file="../common.jsp" %>
<div>
    <div class="p-2">
        <p>Welcome <%= loggedIn!=null ? "<b>"+user.firstName+" "+user.lastName+"</b>" : "" %> to the E-Student portal.</p>
    </div>
    <% if(loggedIn == null) { %>
    <div class="p-2">
        <p>Please <a href="?page=Login">login</a> to continue.</p>
        <p><a href="Test">test</a></p>
    </div>
    <% } else { %>
    <%-- <% if(user != null && user.type.compareTo("manager") == 0) { %>
        <pre class="p-2 border"><%=session.getAttribute("manager")%></pre>
    <% } else if(user != null && user.type.compareTo("teacher") == 0) { %>
        <pre class="p-2 border"><%=session.getAttribute("teacher")%></pre>
    <% } else if(user != null && user.type.compareTo("student") == 0) { %>
        <pre class="p-2 border"><%=session.getAttribute("student")%></pre>
    <% } %> --%>
    <% } %>
</div>
