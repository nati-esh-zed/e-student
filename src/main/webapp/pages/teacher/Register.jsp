<%@ include file="../../common.jsp" %>
<div>
    <% if(isLoggedIn(request)) { %>
    <div class="col-7 mx-auto">
        <form action="teacher.Register" method="post">
        <fieldset>
            <legend>Register Teacher</legend>
            <%-- display success if set --%>
            <% if(session.getAttribute("success") != null) { %>
                <div class="alert alert-dismissible alert-success">
                    <h4 class="alert-heading">Success:</h4>
                    <p class="mb-0"><%=session.getAttribute("success")%></p>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% session.setAttribute("success", null);
            } %>
            <%-- display error if set --%>
            <% if(session.getAttribute("error") != null) { %>
                <div class="alert alert-dismissible alert-warning">
                    <h4 class="alert-heading">Error:</h4>
                    <p class="mb-0"><%=session.getAttribute("error")%></p>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% session.setAttribute("error", null);
            } %>
            <%-- registration form --%>
            <div class="card p-4 shadow-sm p-3 mb-5 bg-white rounded">
                    <div class="form-group">
                        <label for="rtFirstName">FirstName</label>
                        <input type="text" name="firstName" class="form-control" id="rtFirstName" required>
                    </div>
                    <div class="form-group">
                        <label for="rtLastName">LastName</label>
                        <input type="text" name="lastName" class="form-control" id="rtLastName" required>
                    </div>
                    <div class="form-group">
                        <label for="rtPhone">Phone</label>
                        <input type="text" name="phone" class="form-control" id="rtPhone" required>
                    </div>
                    <div class="form-group">
                        <label for="rtEmail">Email</label>
                        <input type="text" name="email" class="form-control" id="rtEmail" required>
                    </div>
                    <div class="form-group">
                        <label for="rtPassword">Password</label>
                        <input type="text" name="password" class="form-control" id="rtPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="rtRole">Role</label>
                        <input type="text" name="role" class="form-control" id="rtRole" required>
                    </div>
                    <button type="submit" class="btn btn-outline-primary w-100 mt-3">Login</button>
            </div>
        </fieldset>
        </form>
    </div>
    <% } else { 
        response.sendRedirect(Site.ROOT);
    } %>
</div>
