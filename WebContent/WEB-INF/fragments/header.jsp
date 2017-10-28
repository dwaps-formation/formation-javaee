<%@ page import="fr.dwaps.utils.Constants, fr.dwaps.beans.User" %>

<%!
User user = new User();
%>

<%
user = (User) session.getAttribute(Constants.USER);
%>

<header>
    <div id="logo"></div>
    
    <div id="welcome-area">
	    <% if (null == user) { %>
	    <form action="/ExJSP/home" method="POST">
	        <input type="text" name="<%= Constants.INPUT_FIRSTNAME %>" placeholder="Prénom..."/>
	        <input type="text" name="<%= Constants.INPUT_LASTNAME %>" placeholder="Nom..."/>
	        <input type="number" name="<%= Constants.INPUT_AGE %>" placeholder="Age..."/>
	        <input type="submit" value="ok" />
	    </form>
	    <% } else { %>
	        Bonjour <%= user.getFirstName() %> !
	    <% } %>
    </div>
</header>