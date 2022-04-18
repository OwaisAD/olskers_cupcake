<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:body>
        <c:choose>
            <c:when test="${sessionScope.basketlist.size() == 0 || sessionScope.basketlist == null}">
                <h1>Din indkøbskurv er tom</h1>
                <form action="opencupcakefactory">
                    <button class="btn btn-primary" style="margin-top: 10px;">Tilføj cupcakes!</button>
                </form>
            </c:when>
            <c:otherwise>

                <h1>Din indkøbskurv</h1>

                <div class="div-in-basket">

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Dine cupcakes</th>
                        <th>Antal</th>
                        <th>Rediger</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="cupcake" items="${sessionScope.basketlist}">
                        <form action="updateinbasket" method="post">
                            <tr>
                                <td>Cupcake med ${cupcake.bottom.getName()} bund og ${cupcake.topping.getName()}
                                    topping
                                </td>
                                <td>Antal: ${cupcake.amount}</td>
                                <td>
                                    <input type="number" id="newamount" name="newamount" min="0" max="250"
                                           value="${cupcake.amount}" required>
                                    <input type="submit" value="Ændre">
                                </td>
                                <input hidden name="bottomname" value="${cupcake.bottom.getName()}">
                                <input hidden name="toppingname" value="${cupcake.topping.getName()}">
                            </tr>

                        </form>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="right-side-box-basket">
                    <p>Pris I alt: ${sessionScope.totalbasketlistprice},-</p>
                    <hr>
                    <p>Dit nuværende kredit er: ${customer.getCredit()},-</p>
                    <hr>
                    <c:choose>
                        <c:when test="${customer.getCredit() >= sessionScope.totalbasketlistprice}">
                            <form action="createorder" method="post">
                                <button type="submit">Opret ordre</button>
                            </form>

                        </c:when>
                        <c:otherwise>
                            <p>Du har ikke nok kredit. Du har oversteget
                                med ${Math.abs(customer.getCredit()-sessionScope.totalbasketlistprice)} kr. Kontakt os
                                for at få kredit eller fjern nogle cupcakes.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:otherwise>
        </c:choose>

        </div>

        <c:if test="${sessionScope.basketlist.size() > 0}">
            <form action="opencupcakefactory">
                <button class="btn btn-primary" style="margin-top: 10px; margin-bottom: 25px">Tilføj cupcakes!</button>
            </form>
        </c:if>


    </jsp:body>

</t:pagetemplate>