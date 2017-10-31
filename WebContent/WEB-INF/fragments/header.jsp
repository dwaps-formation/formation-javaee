<jsp:useBean id="user" class="fr.dwaps.beans.User">
    <jsp:setProperty name="user" property="*"/>
</jsp:useBean>


<header>
    <div id="logo"></div>
    
    <div id="welcome-area">
        <% if (null == session.getAttribute("user")) { %>
        <form action="${pageContext.servletContext.contextPath}/home" method="POST">
            <input type="text" name="${inputNames[0]}" placeholder="Prénom..."/>
            <input type="text" name="${inputNames[1]}" placeholder="Nom..."/>
            <input type="number" name="${inputNames[2]}" placeholder="Age..."/>
            <input type="submit" value="ok" />
        </form>
        <% } %>
        ${ !empty sessionScope.user.firstname ? 'Bonjour ' += sessionScope.user.firstname += ' !' : '' }
    </div>
</header>