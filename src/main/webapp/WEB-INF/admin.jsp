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
            </tr>
            </thead>
            <tbody>

            <c:forEach var="order" items="${sessionScope.orderlist}">
                <tr>
                    <td>${order.created}</td>
                    <td>${order.email}</td>
                    <td>${order.orderId}</td>
                    <td>${order.totalSum}</td>
                    <td> </div>

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Se ordreindhold!
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ordre indhold</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <table class="table table-striped">
                                            <thead>

                                            <tr>
                                                <th>Tid bestilt</th>
                                                <th>Email</th>
                                                <th>Order ID</th>
                                                <th>Saldo sum</th>
                                            </tr>

                                            </thead>

                                        </table>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

    </jsp:body>

</t:pagetemplate>