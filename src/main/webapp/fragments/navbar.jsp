<%@ include file="../common.jsp" %>
<%-- <nav class="navbar navbar-expand-sm border shadow-sm navbar-<%=getTheme(r)%> bg-<%=getTheme(r)%>"> --%>
<%-- <nav class="navbar navbar-expand-sm border shadow-sm" style="background-color: #e0efff; background-image: linear-gradient(to bottom left, #ecf4f0, #5eb94d 70%);"> --%>
<nav class="navbar navbar-expand-sm border shadow-sm" style="background-color: #e0efff">
    <div class="container-fluid">
      <%-- <%=Site.ROOT%> --%>
      <a class="navbar-brand btn" onclick="window.location.reload();">E-Student</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
        data-bs-target="#navbarNav" aria-controls="navbarNav" 
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link <%= activeLink("Home", request) %>" href="<%=Site.ROOT%>?page=Home">
              <i class="fa-solid fa-house"></i>
              Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link <%=activeLink("About", request)%>" href="<%=Site.ROOT%>?page=About">
              <i class="fa-solid fa-info"></i>
              About
            </a>
          </li>
        <% if(isLoggedIn(request)) { %>
          <%-- <li class="nav-item"><a class="nav-link" href="ListUsers">Users</a></li> --%>
          <li class="nav-item"><a class="nav-link" href="RegisterTeacher"></a></li>
          <%-- <% if(getUser(request).type.equls("manager")) { %>
          <li key="teacher" class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Teacher
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                  <li>
                    <a class="dropdown-item" href="RegisterTeacher">
                      Register
                    </a>
                  </li>
                  <li><hr class="dropdown-divider" /></li>
                  <li>
                    <a class="dropdown-item" href="ListTeachers">
                      List
                    </a>
                  </li>
              </ul>
          </li>
          <% } %> --%>
        <% } else { %>
        <% } %>
        </ul>
        <ul class="navbar-nav">
          <% if(isLoggedIn(request)) { %>
            <li key="notifications" class="nav-item">
              <a class="nav-link">
                <i class="fa-regular fa-bell"></i>
                <span class="d-inline-block d-sm-none">Notifications</span>
              </a>
            </li>
            <li key="settings" class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa-solid fa-gear"></i>
                    <span class="d-inline-block d-sm-none">Options</span>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                
                    <li>
                      <a class="dropdown-item" href="Profile">
                        <i class="fa-regular fa-user"></i>
                        Profile
                       </a>
                    </li>
                    <li><hr class="dropdown-divider" /></li>
                    <li>
                        <a class="dropdown-item" href="Logout">
                          <i class="fa-solid fa-arrow-right-from-bracket"></i>
                          Logout
                        </a>
                    </li>
                </ul>
            </li>
          <% } else { %>
            <li>
              <a class="dropdown-item <%=activeLink("Login", request)%>" href="<%=Site.ROOT%>?page=Login">
                <i class="fa-solid fa-right-to-bracket"></i>
                Login
              </a>
            </li>
          <% } %>
        </ul>
      </div>
    </div>
  </nav>