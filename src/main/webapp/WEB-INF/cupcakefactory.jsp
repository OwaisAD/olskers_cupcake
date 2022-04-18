<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>

    <jsp:body>

        <div class="text-center pt-3">
            <h1 style="font-weight: bold">🧁 Cupcake factory! 🧁</h1>
            <h2 style="font-weight: lighter; font-size: 26px;">Øens bedste cupcakes.</h2>
            <br><br>
            <div class="text-holder">
                <h3 class="text">Klik og bestil her</h3>
            </div>
        </div>


        <!--div rundt om både højre og venstre side-->

        <div class="grid-container">

            <!--dette er venstre side på siden, altså alle dropdown menuerne-->
            <div class="div-around-left-side">
                <!--følgende er venstre side af dropdown menuerne altså der hvor man kan vælge bund og topping-->
                <form action="addtobasket" method="post">
                    <div class="left-side-of-left-side">
                        <div class="bund-og-topping">
                            <label for="bottoms">Vælg en bund:</label>
                            <select class="styled-select" name="bottoms" id="bottoms">
                                <c:forEach items="${applicationScope.bottomlist}" var="bottoms">
                                    <option value="${bottoms.bottomId}">${bottoms.name} (${bottoms.price},-)</option>
                                </c:forEach>
                            </select>
                            <br><br>
                            <label for="toppings">Vælg en topping:</label>
                            <select class="styled-select" name="toppings" id="toppings">
                                <c:forEach items="${applicationScope.toppinglist}" var="toppings">
                                    <option value="${toppings.toppingId}">${toppings.name} (${toppings.price},-)
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!--følgende er højre side af dropdown menuerne altså der hvor man kan vælge antal-->
                        <div class="right-side-of-left-side">
                            <div class="vaelg-antal">
                                <label for="amount">Vælg antal: </label>
                                <select class="styled-select-v2" name="amount" id="amount">
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
                        </div>
                    </div>
                    <div class="knap-i-factory">
                        <button class="btn btn-primary button-styling" type="submit">
                            Læg i kurv
                        </button>
                    </div>
                </form>

            </div>

            <!--dette er højre side på siden, altså der hvor man ser cupcakes pris og kredit tilbage-->
            <form action="openbasket" method="post">
                <div class="div-around-right-side">
                    <!--Pris pr cupcakes-->
                    <!--Pris i alt: -->
                    <!--Kredit tilbage-->

                    <div class="right-side-box">
                        <div class="div-around-info">
                            <c:choose>
                                <c:when test="${cupcake.getBottom().getName() != null}">
                                    <p>Prisen for valgt cupcake: ${cupcake.getPrice()},-</p>
                                    <c:choose>
                                        <c:when test="${sessionScope.amount > 1}">
                                            <p>Pris i alt for ${sessionScope.amount}
                                                cupcakes: ${sessionScope.pricetotal},-</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Pris i alt for ${sessionScope.amount} cupcake: ${sessionScope.pricetotal},-</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <hr class="hr-styling">
                                    <p>Ledig kredit: ${customer.getCredit()},-</p>
                                    <hr class="hr-styling">
                                    <p style="font-weight: bold">Sidst valgte cupcake</p>
                                    <p>Bund: ${cupcake.getBottom().getName()}</p>
                                    <p>Topping: ${cupcake.getTopping().getName()}</p>
                                    <hr class="hr-styling">
                                    <button>Gå til kurv</button>
                                </c:when>
                                <c:otherwise>
                                    <p>Ingen cupcakes i din kurv endnu.</p>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>

                </div>
            </form>
        </div>

    </jsp:body>

</t:pagetemplate>