<%@ page
	contentType="text/html; charset=UTF-8"
	errorPage="templates/error.jsp"
 %>


<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" href="ressources/CSS/style.css">
	<link href="https://fonts.googleapis.com/css?family=Hanalei" rel="stylesheet">
	<title>Ma page de test</title>
</head>

<jsp:include page="templates/header.jsp"></jsp:include>
<%-- <%@ include file="templates/header.jsp" %> pareil --%> 
<jsp:include page="templates/body.jsp"></jsp:include>
<jsp:include page="templates/footer.jsp"></jsp:include>
</html>			