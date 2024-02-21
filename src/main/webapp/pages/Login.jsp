<%@ include file="../common.jsp" %>
<div>
    <% if(!isLoggedIn(request)) { %>
    <div class="col-8 mx-auto">
        <form action="Login" method="post">
        <fieldset>
            <legend>Login</legend>
            <% if(session.getAttribute("error") != null) { %>
                <div class="alert alert-dismissible alert-warning">
                    <h4 class="alert-heading">Error:</h4>
                    <p class="mb-0"><%=session.getAttribute("error")%></p>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% session.setAttribute("error", null);
            } %>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" name="password" class="form-control" id="exampleInputPassword1" required>
            </div>
            <div class="form-group form-check my-2">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Keep me logged in</label>
            </div>
            <button type="submit" class="btn btn-outline-primary w-100">Login</button>
        </fieldset>
        </form>
    </div>
    <% } else { 
        response.sendRedirect(Site.ROOT);
    } %>
</div>
