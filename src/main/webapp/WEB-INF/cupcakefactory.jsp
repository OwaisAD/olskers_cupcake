<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>

    <jsp:attribute name="footer">
        Cupcake factory
    </jsp:attribute>

    <jsp:body>

        <h1>Cupcake factory!</h1>
        <h2>Øens bedste cupcakes.</h2>
        <br><br><br>

        <h3>Klik og bestil her</h3>

        <!--dette er venstre side på siden, altså alle dropdown menuerne-->
        <div>
            <!--følgende er venstre side af dropdown menuerne altså der hvor man kan vælge bund og topping-->
            <form action="addtobasket" method="post">
            <div>
                <label for="bottoms">Vælg en bund:</label>
                   <select name="bottoms" id="bottoms">
                        <c:forEach items="${applicationScope.bottomlist}" var="bottoms">
                            <option value="${bottoms.bottomId}">${bottoms.name} (${bottoms.price},-)</option>
                        </c:forEach>
                    </select>
                    <br><br>
                    <label for="toppings">Vælg en topping:</label>
                    <select name="toppings" id="toppings">
                        <c:forEach items="${applicationScope.toppinglist}" var="toppings">
                            <option value="${toppings.toppingId}">${toppings.name} (${toppings.price},-)</option>
                        </c:forEach>
                    </select>
            </div>

            <!--følgende er højre side af dropdown menuerne altså der hvor man kan vælge antal-->
            <div>
                <label for="amount">Vælg antal: </label>
                <select name="amount" id="amount">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                </select>
            </div>

                <input type="submit" value="Læg i kurv">
            </form>

        </div>
        
        <!--dette er højre side på siden, altså der hvor man ser cupcakes pris og kredit tilbage-->
        <div style="background-color: white">
            <!--Pris pr cupcakes-->
            <!--Pris i alt: -->
            <!--Kredit tilbage-->
            <form action="openbasket" method="post">
                <c:choose>
                    <c:when test="${cupcake.getBottom().getName() != null}">
                        <p>Prisen for valgt cupcake: ${cupcake.getPrice()},-</p>
                     <c:choose>
                         <c:when test="${sessionScope.amount > 1}">
                        <p>Pris i alt for ${sessionScope.amount} cupcakes: ${sessionScope.pricetotal},-</p>
                         </c:when>
                        <c:otherwise>
                            <p>Pris i alt for ${sessionScope.amount} cupcake: ${sessionScope.pricetotal},-</p>
                        </c:otherwise>
                     </c:choose>
                        <hr>
                        <p>Ledig kredit: ${customer.getCredit()},-</p>
                        <hr>
                        <p>Sidst valgte cupcake:</p>
                        <p>Bund: ${cupcake.getBottom().getName()}</p>
                        <p>Topping: ${cupcake.getTopping().getName()}</p>
                        <hr>
                </c:when>
                    <c:otherwise>
                        <p>Ingen cupcakes i din kurv endnu.</p>
                        <hr>
                    </c:otherwise>
                </c:choose>

                <button>Gå til kurv</button>
            </form>
        </div>


    </jsp:body>

</t:pagetemplate>