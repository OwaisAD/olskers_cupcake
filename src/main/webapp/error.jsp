<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
             Fejlside
    </jsp:attribute>

    <jsp:attribute name="footer">
            Fejlside
    </jsp:attribute>

    <jsp:body>

        <p>Der skete en fejl. Muligvis grundet: </p>

        <c:if test="${pageContext.errorData.statusCode == 404 }">
            <p><b>Fejl kode: </b> ${pageContext.errorData.statusCode}</p>
        </c:if>

        <c:if test="${pageContext.errorData.statusCode == 500 }">
            <p><b>Fejl kode: </b> ${pageContext.errorData.statusCode}</p>
            <!--<p>A serious error happened at the server.</p>-->
        </c:if>


        <c:if test="${requestScope.errormessage != null}">
            <p>${requestScope.errormessage}</p>
        </c:if>

        <c:if test="${requestScope.errormessage  == null}">
            <!--<p>Abandon ship. We have no idea how you ended up here!</p>-->
        </c:if>

        <p>Hop tilbage til <a href="index.jsp">forsiden</a>,
             for at logge ind igen.</p>

    </jsp:body>
</t:pagetemplate>