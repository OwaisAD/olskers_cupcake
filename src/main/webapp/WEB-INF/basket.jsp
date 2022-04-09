<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>


    <jsp:body>


        <c:choose>
            <c:when test="${sessionScope.basketlist.size() == 0}">
                <h1>Din indkøbskurv er tom</h1>
            </c:when>
            <c:otherwise>

                <h1>Din indkøbskurv</h1>

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
                                <td>Cupcake med ${cupcake.bottom.getName()} bund og ${cupcake.topping.getName()} topping</td>
                                <td>Antal: ${cupcake.amount}</td>
                                <td>
                                    <input type="number" id="newamount" name="newamount" min="0" max="250" value="${cupcake.amount}">
                                    <input type="submit" value="Ændre">

                                </td>
                                    <input hidden name="bottomname" value="${cupcake.bottom.getName()}">
                                    <input hidden name="toppingname" value="${cupcake.topping.getName()}">
                                </tr>

                        </form>
                    </c:forEach>
                    </tbody>
                </table>

                <div style="background-color: white; width: 400px; height: 400px;">
                    <p>Pris I alt: ${sessionScope.totalbasketlistprice},-</p>

                    <button>Opret ordre</button>
                </div>

            </c:otherwise>
        </c:choose>

        <c:choose>
        <c:when test="${!(customer.getCredit() < sessionScope.pricetotal)}">
            <p>Dit nuværende kredit er: ,-</p>
        </c:when>
        <c:otherwise>
            <p>Du har ikke nok kredit. Kontakt os for at få kredit.</p>
        </c:otherwise>
        </c:choose>

        <form action="opencupcakefactory">
            <button>Tilføj cupcakes!</button>
        </form>

    </jsp:body>

</t:pagetemplate>