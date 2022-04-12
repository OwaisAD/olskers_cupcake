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
    <title>
        <jsp:invoke fragment="header"/>
    </title>
    <style> <%@include file="/css/style.css" %> </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<div>
    <a href="index.jsp">
        <img id="header-image" src="images/headercupcakeimage.png" alt="billeder af olskers cupcake">
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
                    <c:if test="${sessionScope.admin != null }">
                        <form action="AdminNavigation" method="get">
                            <input type="submit" id="ordrer" name="handling" type="button" value="Ordrer">
                            <input type="submit" id="kunder" name="handling" type="button" value="Kunder">
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.customer != null }">
                        <p class="nav-item">${sessionScope.email}</p>
                    </c:if>
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/">Forside</a>
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/omos.jsp">Om os</a>
                    <c:if test="${sessionScope.customer != null && sessionScope.admin == null}">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/opencupcakefactory">Cupcake
                            maker</a>
                    </c:if>
                    <c:if test="${sessionScope.customer != null && sessionScope.admin == null}">
                        <a class="nav-item nav-link"
                           href="${pageContext.request.contextPath}/ProfilNavigation">Profil</a>
                    </c:if>
                    <c:if test="${sessionScope.customer != null && sessionScope.admin == null}">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/openbasket"><i class="fa fa-shopping-basket fa-2x"></i></a>
                    </c:if>

                    <c:if test="${sessionScope.admin == null && sessionScope.customer == null}">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                            Log ind!
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Du kan logge ind her</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <form action="login" method="post">
                                            <label for="email">Email: </label>
                                            <br>
                                            <input type="email" id="email" name="email" required/>
                                            <br>
                                            <label for="password">Kodeord: </label>
                                            <br>
                                            <input type="password" id="password" name="password" minlength="4"
                                                   required/>
                                            <br>
                                            <br>
                                            <input type="submit" value="Log ind"/>
                                            <br>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#modal2" aria-label="Close"
                                                data-dismiss="#exampleModal">
                                            Ikke medlem endnu? Klik her.
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.customer != null || sessionScope.admin != null}">
                        <button formaction="logout">
                            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/logout">Log ud</a>
                        </button>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</header>

<div id="body" class="container mt-4" style="min-height: 400px; background-color: rgba(128, 128, 128, 5%);">
    <h1>
        <jsp:invoke fragment="header"/>
    </h1>
    <jsp:doBody/>
</div>


<!-- Footer
<footer class="text-center text-black" style="background-color: rgba(128, 128, 128, 5%);">
    <div class="container" style="padding: 20px 0px;">

        <div class="row">
            <div class="col-sm">
            <div>
                <a href="mailto: olskers@cupcakes.com">Send os en email</a><br/>
                <a href="tel: 70707070">Ring til os</a>
            </div>
            </div>


            <div class="col-sm">
            <a class="btn btn-outline-dark btn-floating m-1" href="#!" role="button"
            ><i class="fa fa-instagram"></i
            ></a>


            <a class="btn btn-outline-dark btn-floating m-1" href="#!" role="button"
            ><i class="fa fa-facebook"></i
            ></a>


            <a class="btn btn-outline-dark btn-floating m-1" href="#!" role="button"
            ><i class="fa fa-linkedin"></i
            ></a>
        </div>

            <div class="col-sm">
            <div>
                Peter Knudsens Vej<br/>
                Cvr. 22334455
            </div>
            </div>
        </div>
    </div>
</footer>
-->



<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>