<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Profil
    </jsp:attribute>

    <jsp:attribute name="footer">
        Profil
    </jsp:attribute>

    <jsp:body>

        <p>Dine tidligere ordre</p>

        <h3>Her er listen over alle dine registrerede ordrer</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order id</th>
                    <th>Antal</th>
                    <th>Cupcake bund</th>
                    <th>Cupcake topping</th>
                    <th>Stykpris</th>
                    <th>Total pris</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="linjer" items="${sessionScope.list}">
                    <tr>
                        <td>${linjer.orderId}</td>
                        <td>${linjer.amount}</td>
                        <td>${linjer.bottom}</td>
                        <td>${linjer.topping}</td>
                        <td>${linjer.price}</td>
                        <td>${linjer.totalSum}</td>
                    </tr>
                </c:forEach>
            </tbody>


        </table>

        <button class="btn btn-primary">Gå til factory!</button>

    </jsp:body>

</t:pagetemplate>