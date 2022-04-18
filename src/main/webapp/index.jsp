<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>

    <jsp:attribute name="footer">
        Forside
    </jsp:attribute>

    <jsp:body>

        <h2 class="text-center" style="padding: 25px 0px; font-weight: 400;">Bestil lige præcis den cupcake du helst vil ha'!</h2>

        <div class="row d-flex justify-content-center">
            <div class="col-md-7">

                <div id="carouselExampleIndicators" class="carousel slide mb-5" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/forside_billeder/cupcake1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/forside_billeder/cupcake3.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/forside_billeder/cupcake2.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>

        <!-- Button trigger modal -->
        <c:if test="${customer == null && admin == null}">
        <div class="d-flex justify-content-center" style="padding-bottom: 30px;">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Start din rejse!
        </button>
        </div>
        </c:if>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Du kan logge ind her</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="login" method="post">
                            <label for="email">Email: </label>
                            <br>
                            <input type="email" id="email" name="email" required/>
                            <br>
                            <label for="password">Kodeord: </label>
                            <br>
                            <input type="password" id="password" name="password" minlength="4" required/>
                            <br>
                            <br>
                            <button type="submit" class="btn btn-primary">
                                Log ind
                            </button>
                            <br>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal2"
                                aria-label="Close" data-dismiss="#exampleModal">
                            Ikke medlem endnu? Klik her.
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Opret login</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="createuser" method="post">
                            <label for="emailny">Email: </label> <br>
                            <input type="email" id="emailny" name="emailny" required> <br> <br>
                            <label for="passwordny">Kodeord: </label> <br>
                            <input type="password" id="passwordny" name="passwordny" minlength="4" required> <br> <br>
                            <label for="passwordRepeated">Gentag kodeord: </label> <br>
                            <input type="password" id="passwordRepeated" name="passwordRepeated" minlength="4" required>
                            <br>
                            <br>
                            <button type="submit" class="btn btn-primary" formaction="createuser">
                                Bliv medlem
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>

</t:pagetemplate>