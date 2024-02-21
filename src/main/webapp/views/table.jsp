<%@ include file="../common.jsp" %>
<div>
    <h4>Users</h4>
    <hr />
    <% ArrayList<User> users = (ArrayList<User>)request.getSession().getAttribute("users"); %>
    <% if(users != null) { %>
    <%-- <pre><%=users%></pre> --%>
    <%-- table-bordered-inside-x table-bordered-inside-y --%>
    <table class="table table-striped table-custom table-spaced table-rounded">
        <thead>
            <tr>
                <th>ID USER</th>
                <th>TYPE</th>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>EMAIL</th>
                <th>PASSWORD</th>
            </tr>
        </thead>
        <tbody>
        <form>
        <% for(User useri : users) { %>
            <tr>
                <td><%=useri.idUser%></td>
                <td><%=useri.type%></td>
                <td><%=useri.firstName%></td>
                <td><%=useri.lastName%></td>
                <td><%=useri.email%></td>
                <td><%=useri.password%></td>
            </tr>
        <% } %>
        </form>
        </tbody>
    </table>
    <% } %>
</div>
