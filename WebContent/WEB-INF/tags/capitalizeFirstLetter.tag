<%@ tag pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ attribute name="data" required="true" %>
<%@ attribute name="result" rtexprvalue="false" required="true" %>
<%@ variable name-from-attribute="result" alias="resultCode" scope="NESTED" %>


<c:set
    value="${fn:toUpperCase(fn:substring(data, 0, 1)) += fn:toLowerCase(fn:substring(data, 1, fn:length(data.toString())))}"
    var="resultCode"
    />

<jsp:doBody></jsp:doBody>