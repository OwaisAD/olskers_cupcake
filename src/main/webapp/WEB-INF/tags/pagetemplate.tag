<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><jsp:invoke fragment="header"/></title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<div>
    <a href="index.jsp">
    <img src="images/headercupcakeimage.png" alt="billeder af olskers cupcake" style="width: 100%; height: 280px; padding: 20px;">
    </a>
</div>

<header style="padding: 0px 15px;">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container" style="padding: 5px;">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/">Page 1</a>
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/">Page 2</a>
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/">Page 3</a>
                    <c:if test="${sessionScope.user == null }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/login.jsp">Login</a>
                    </c:if>
                    <c:if test="${sessionScope.user != null }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/logout">Log out</a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</header>

<div id="body" class="container mt-4" style="min-height: 400px; background-color: rgba(128, 128, 128, 5%);">
    <h1><jsp:invoke fragment="header"/></h1>
    <jsp:doBody/>
</div>

<!-- Footer -->
<div class="container mt-3" style="background-color: rgba(128, 128, 128, 5%);">
    <hr/>
    <div class="row mt-4">
        <div class="col">
            <a href="mailto: olskers@cupcakes.com">Send os en email</a><br/>
            <a href="tel: 70707070">Ring til os</a>
        </div>
        <div class="col">
            <p>Følg os på</p>
            <p><img src="images/socialemedier/instagram.png" alt="facebook ikon" style="width: 30px; height: auto;">
                <img src="images/socialemedier/facebook.png" alt="facebook ikon" style="width: 30px; height: auto;">
                <img src="images/socialemedier/linkedin.png" alt="linkedin ikon" style="width: 30px; height: auto;"></p>
        </div>
        <div class="col">
            Peter Knudsens Vej<br/>
            Cvr. 22334455
        </div>
    </div>

</div>

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>