<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>E-Student</title>
    <jsp:include page="fragments/common.jsp" />
</head>
<body class="container">
    <div class="border shadow-sm">
        <header>
            <jsp:include page="fragments/navbar.jsp" />
        </header>
        <main class="container p-3 border overflow-x-auto">
            <div class="p-2">
                <jsp:include page="IncludePage" />
            </div>
        </main>
        <footer class="p-2" style="background-color: #fcfcfc">
            <jsp:include page="fragments/now.jsp" />
            <div class="mx-auto text-center p-2">
                <pre>Copyright (C) 2024</pre>
            </div>
        </footer>
    </div>
</body>
</html>