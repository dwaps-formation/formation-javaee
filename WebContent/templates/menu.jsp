<%!
String[] navItems = {
    "Accueil",
    "Pr�sentation",
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