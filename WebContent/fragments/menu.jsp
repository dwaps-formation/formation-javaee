<%!
String[] navItems = {
    "Accueil",
    "Présentation",
    "Contact"
};
%>

<nav>
    <ul>
		<% for (String item : navItems) { %>
		<li><%= item %></li>
		<% } %>
    </ul>
</nav>