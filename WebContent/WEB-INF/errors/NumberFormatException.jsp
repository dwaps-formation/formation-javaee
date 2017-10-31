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
        <h1>Euh...</h1>
        <p>Vous êtes sûr d'avoir rentré un nombre là ?</p>
        <p>Hop, hop, hop ! Retour à l'<a href="${pageContext.servletContext.contextPath}/home">accueil</a> !</p>
    </body>
</html>