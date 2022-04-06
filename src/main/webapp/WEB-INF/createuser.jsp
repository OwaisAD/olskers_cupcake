<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Opret bruger
    </jsp:attribute>

    <jsp:attribute name="footer">
        Opret bruger
    </jsp:attribute>

    <jsp:body>

        <p>Opret bruger </p>

        <form action="createuser" method="post">
            <label for="email">Email: </label>
            <input type="text" id="email" name="email">
            <label for="password">Kodeord: </label>
            <input type="password" id="password" name="password">
            <label for="passwordRepeated">Gentag kodeord: </label>
            <input type="password" id="passwordRepeated" name="passwordRepeated">
            <input type="submit" value="Bliv medlem" formaction="createuser">
        </form>

    </jsp:body>

</t:pagetemplate>