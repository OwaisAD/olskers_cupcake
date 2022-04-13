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
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Tid bestilt</th>
                <th>Email</th>
                <th>Order ID</th>
                <th>Saldo sum</th>
                <th>Indhold</th>
            </tr>
            </thead>
            <tbody>

            <!-- Kan bruges til at holde ordre Id-->
            <c:set var="index" value="0"></c:set>

            <c:forEach var="order" items="${sessionScope.orderlist}">
                <tr>
                    <td>${order.created}</td>
                    <td>${order.email}</td>
                    <td ${index=index+1}>${order.orderId}</td>
                    <td>${order.totalSum}</td>

                    <!--  Nedenstående viser alle ordrerlinjer kan ikke sortere  -->
                    <td> </div>

                        <form method="post">


                            <!-- Button trigger modal -->
                            <button formaction="OrderDescription" name="orderId" value="${order.orderId}"
                                    class="btn btn-secondary">
                                Se ordreindhold!

                            </button>

                        </form>

                    </td>


                </tr>
            </c:forEach>

            <!-- Modal -->
            <c:if test="${requestScope.orderlineDescriptionDTO != null}">

                <table class="table table-striped">
                    <thead>

                    <tr>
                        <th>Order Id</th>
                        <th>Bund</th>
                        <th>Topping</th>
                        <th>Stykpris</th>
                        <th>Antal</th>
                        <th>Saldo sum</th>
                    </tr>


                    </thead>
                    <tbody>


                    <c:forEach var="orderline"
                               items="${requestScope.orderlineDescriptionDTO}">

                        <tr>
                            <td>${orderline.orderId}</td>
                            <td>${orderline.bottom}</td>
                            <td>${orderline.topping}</td>
                            <td>${orderline.price}</td>
                            <td>${orderline.amount}</td>
                            <td>${orderline.totalSum}</td>
                        </tr>

                    </c:forEach>


                    </tbody>


                </table>

            </c:if>



            </tbody>
        </table>

    </jsp:body>

</t:pagetemplate>