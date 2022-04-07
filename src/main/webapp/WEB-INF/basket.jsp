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
                    <form action="updatebasket" method="post">
                    <tr>
                        <td>Cupcake med ${cupcake.bottom.getName()} bund og ${cupcake.topping.getName()} topping</td>
                        <td>Antal: ${cupcake.amount}</td>
                        <td>
                             <button type="button" name="remove" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-close"></i></button>
                            <button type="button" name="add" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-plus"></i></button>
                        </td>

                        <input hidden name="bottomname" value="${cupcake.bottom.getName()}">
                        <input hidden name="toppingname" value="${cupcake.topping.getName()}">
                    </tr>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Hvor mange vil de fjerne?</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                        <label for="amounttodelete">Antal: </label>
                                        <br>
                                        <input type="number" min="1" max="1000000000000" id="amounttodelete" name="amounttodelete" required/>
                                        <br>
                                        <br>
                                        <button type="submit" class="btn btn-dark">
                                            Bekræft antal
                                        </button>
                                        <br>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </c:forEach>
            </tbody>
        </table>

            </c:otherwise>
        </c:choose>

    </jsp:body>

</t:pagetemplate>