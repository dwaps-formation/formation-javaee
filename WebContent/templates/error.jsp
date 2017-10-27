<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage ="true" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR MON POTE</title>
</head>
<body>
<h1> NON SA marche pas .... :(</h1>
<% 
	if(exception.getClass().getName() == "org.apache.jasper.JasperException"){
		out.print("Non ecrire des lettres sa marche pas !");
	}
%>

</body>
</html>