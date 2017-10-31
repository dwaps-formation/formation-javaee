<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath += initParam.mainCSS}">
		<title>Exercices JSP</title>
	</head>
	

	<body>
	
	<%@ include file="/WEB-INF/fragments/header.jsp" %>
	<%@ include file="/WEB-INF/fragments/menu.jsp" %>
	<%@ include file="/WEB-INF/fragments/body.jsp" %>
	<%@ include file="/WEB-INF/fragments/footer.jsp" %>
	
    <script src="${pageContext.servletContext.contextPath += initParam.mainJS}"></script>
	</body>
</html>