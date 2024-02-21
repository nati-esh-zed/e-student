<%@ include file="../common.jsp" %>
<div>
    <div class="p-2">
        <div class="jumbotron">
            <h1 class="display-3">E-Student portal</h1>
            <p class="lead">Welcome <%=isLoggedIn(request) ? "<b>"+getUser(request).firstName+" "+getUser(request).lastName+"</b>" : "" %> to the E-Student portal.</p>
            <hr class="my-4">
            <p>This is a university-local website that provides 
                functionality to manage curriculum, teachers and students.</p>
            <p class="lead">
                <a class="btn btn-primary btn-md" href="?page=About" role="button">Learn more</a>
            </p>
        </div>
        <% if(!isLoggedIn(request)) { %>
        <div class="p-2">
            <p>Please <a href="?page=Login">login</a> to continue.</p>
            <%-- <form action="Mock">
                <div class="row">
                    <input class="col form-control" type="text" name="table" />
                    <button class="col-3 btn btn-outline-primary" type="submit" href="Mock">mock</button>
                </div>
            </form> --%>
        </div>
        <% } else { %>
            <% if(getManagerUser(request) != null) { 
                ManagerUser managerUser = getManagerUser(request); %>
            <div class="border p-2">
                <div>idUser: <%=managerUser.idUser%></div>
                <div>firstName: <%=managerUser.firstName%></div>
                <div>lastName: <%=managerUser.lastName%></div>
                <div>phone: <%=managerUser.phone%></div>
                <div>email: <%=managerUser.email%></div>
                <div>password: <%=managerUser.password%></div>
                <div>role: <%=managerUser.role%></div>
            </div>
            <% } %>
            <% if(getFullManager(request) != null) { 
                FullManager fullManager = getFullManager(request); %>
            <div class="border p-2">
                <div>idUser: <%=fullManager.idUser%></div>
                <div>idDepartment: <%=fullManager.idDepartment%></div>
                <div>idSchool: <%=fullManager.idSchool%></div>
                <div>type: <%=fullManager.type%></div>
                <div>firstName: <%=fullManager.firstName%></div>
                <div>lastName: <%=fullManager.lastName%></div>
                <div>phone: <%=fullManager.phone%></div>
                <div>email: <%=fullManager.email%></div>
                <div>password: <%=fullManager.password%></div>
                <div>role: <%=fullManager.role%></div>
                <div>departmentName: <%=fullManager.departmentName%></div>
                <div>departmentShortCode: <%=fullManager.departmentShortCode%></div>
                <div>schoolName: <%=fullManager.schoolName%></div>
                <div>schoolShortCode: <%=fullManager.schoolShortCode%></div>
            </div>
            <% } %>
        <% } %>
    </div>
</div>
