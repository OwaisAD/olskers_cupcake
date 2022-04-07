<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Admin
    </jsp:attribute>

    <jsp:attribute name="footer">
        Admin
    </jsp:attribute>

    <jsp:body>
        <h3>Her er listen over alle registreret kunder i databasen</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Email</th>
                <th>Kunde's kredit</th>
                <th>Tilføj mere kredit til kunde's konto</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="kunder" items="${sessionScope.customerlist}">
                <tr>
                    <td>${kunder.email}</td>
                    <td>${kunder.credit}</td>
                    <td><button type="button" class="btn btn-dark">Tilføj</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </jsp:body>

</t:pagetemplate>