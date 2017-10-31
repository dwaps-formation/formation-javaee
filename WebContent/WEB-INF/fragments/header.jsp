<jsp:useBean id="user" class="fr.dwaps.beans.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>


<header>
    <div id="logo"></div>
    
    <div id="welcome-area">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                Bonjour <c:out value="${fn:toUpperCase(sessionScope.user.firstname)}"></c:out> !
            </c:when>
            <c:otherwise>
	        <form action="${pageContext.servletContext.contextPath}/home" method="POST">
	            <input type="text" name="${inputNames[0]}" placeholder="Prénom..."/>
	            <input type="text" name="${inputNames[1]}" placeholder="Nom..."/>
	            <input type="number" name="${inputNames[2]}" placeholder="Age..."/>
	            <input type="submit" value="ok" />
	        </form>
            </c:otherwise>
        </c:choose>
    </div>
</header>