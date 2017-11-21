<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Page d'authentification</title>
		<style>
		  body {
		      width: 980px;
		      display: flex;
		      justify-content: center;
		  }
		</style>
	</head>
	

	<body>
		<form action="<c:url value='/home'/>" method="POST">
		  <input
		      type="text"
		      maxlength="70"
		      placeholder="Pseudo"
		      name="pseudo"
		      value="${pseudo}"
		      required="required"
		      autofocus />
		  <br />
		  <input
		      type="password"
		      pattern="\d{6,8}"
		      title="Série de 6 à 8 chiffres"
		      maxlength="8"
		      placeholder="Mot de passe"
		      required="required"
		      name="pwd" />
		  <br />
		  <button type="submit">Valider</button>
		</form>
	</body>
</html>