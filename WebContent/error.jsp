<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<%@include file="fragments/header.jsp" %>

<div class="container">
	<h2>Erreur <%= exception.getClass().getName() + " " + exception.getMessage() %></h2>
</div>

<%@include file="fragments/footer.jsp" %>