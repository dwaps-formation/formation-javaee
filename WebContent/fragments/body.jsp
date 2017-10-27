<%--<%@ page import="fr.fred.classes.DateHandler" %> --%>
<%@ page import="fr.fred.classes.HandlerDate" %>
<%!
HandlerDate hd = new HandlerDate();
%>
<%
String result = "";
String jourN = request.getParameter("jour");

if (null != jourN && "" != jourN) {
	try {
		int jour =  Integer.parseInt(jourN);
		
		hd.setNbOfDay(jour);
		result = hd.displayDate();
	} catch (Exception e) {
		result = "<span class=\"error\">La valeur saisie n'est pas correcte...</span>";
	}
}
%>
<div class="container">
	<form method="get">
		<label>Choisir un numéro de jour de l'année [1-365] : <input type="number" value="<%= jourN %>" name="jour"/></label>
		<button type="submit">Valider</button>
	</form>
	<% if ("" != result) { %>
		<div class="result"><%= result %></div>
	<% } %>
</div><!-- /.container -->