<%@ page isErrorPage="true" %>

<%!
String errorMsg;
%>

<% 
if (exception.getClass().getName() == "java.lang.NumberFormatException") {
	errorMsg = "La conversion en int n'a pas pu se faire !";
    System.out.println("JSP ERROR : " + errorMsg);
    out.write(errorMsg);
}
%>
