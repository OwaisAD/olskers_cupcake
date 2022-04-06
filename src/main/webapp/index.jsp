<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Forside
    </jsp:attribute>

    <jsp:attribute name="footer">
        Forside
    </jsp:attribute>

    <jsp:body>

        <p>Startcode for 2nd semester </p>

        <c:if test="${sessionScope.user != null}">
            <p>You are logged in with the role of "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>You are not logged in yet. You can do it here: <a
                    href="login.jsp">Login</a></p>
        </c:if>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Start din rejse!
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Du kan logge ind her</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="login" method="post">
                            <label for="email">Username: </label>
                            <br>
                            <input type="text" id="email" name="email"/>
                            <br>
                            <label for="password">Password: </label>
                            <br>
                            <input type="password" id="password" name="password"/>
                            <br>
                            <br>
                            <input type="submit"  value="Log in"/>
                            <br>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" aria-label="Close">
                            Ny bruger?
                        </button>



                    </div>
                </div>
            </div>
        </div>

    </jsp:body>

</t:pagetemplate>