<%@ include file="../common.jsp" %>
<div>
    <div class="p-2">
        <p>Welcome <%=isLoggedIn(request) ? "<b>"+getUser(request).firstName+" "+getUser(request).lastName+"</b>" : "" %> to the E-Student portal.</p>
    </div>
    <% if(!isLoggedIn(request)) { %>
    <div class="p-2">
        <p>Please <a href="?page=Login">login</a> to continue.</p>
        <form action="Mock">
            <div class="row">
                <input class="col form-control" type="text" name="table" />
                <button class="col-3 btn btn-outline-primary" type="submit" href="Mock">mock</button>
            </div>
        </form>
    </div>
    <% } else { %>
    <% } %>
</div>
