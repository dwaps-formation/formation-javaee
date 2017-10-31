<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Erreur 404</title>
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath += initParam.mainCSS}">
	</head>
	

	<body>
	    <h1>Page introuvable</h1>
		<p>Loupé :D</p>
		<p>Il vous reste plus qu'à retourner à l'<a href="${pageContext.servletContext.contextPath}/home">accueil</a>...</p>
	</body>
</html>