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
        <h3>Her listen over alle kunders ordrer</h3>
        <table>
            <thead>
            <tr>
                <th>Tid bestilt</th>
                <th>Email</th>
                <th>Order ID</th>
                <th>Saldo sum</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="AllOrderlinesDTO" items="${requestScope.}"

            </tbody>
        </table>



    </jsp:body>

</t:pagetemplate>