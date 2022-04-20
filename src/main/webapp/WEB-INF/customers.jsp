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
                <th style="text-align: right; padding-right: 20%">Kunde's kredit</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="kunder" items="${sessionScope.customerlist}">
                <tr>
                    <td>${kunder.email}</td>
                    <td style="text-align: right; padding-right: 20%">${kunder.credit}</td>
                    <td>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Hvor meget ønsker de at
                                            indsætte?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <form action="addcredit" method="post">
                                            <label for="cus-email">Email:</label>
                                            <br>
                                            <input type="email" id="cus-email" name="cus-email" required/>
                                            <br>
                                            <br>
                                            <label for="amount">Beløb:</label>
                                            <br>
                                            <input type="number" id="amount" name="amount" required min="1" max="1500" size="20"/>
                                            <br>
                                            <br>
                                            <button type="submit" class="btn btn-dark">
                                                Bekræft beløb
                                            </button>
                                            <br>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                    style="margin: 20px 0px;">
                Tilføj kredit
            </button>
            </tbody>
        </table>


    </jsp:body>

</t:pagetemplate>