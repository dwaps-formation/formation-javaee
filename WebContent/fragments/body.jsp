<%--<%@ page import="fr.fred.classes.DateHandler" %> --%>
<%@ page import="fr.fred.classes.HandlerDate" %>
<%!
/*DateHandler dh = new DateHandler();

public String getResultHtml(String mois, String jourSemaine) {
	String result = "";
	result += "<div class=\"result\">";
	result += "<p>Mois du jour : " + mois + "</p>";
	result += "<p>Jour de la semaine : " + jourSemaine + "</p>";
	result += "</div>";
	
	return result;
}*/

HandlerDate hd = new HandlerDate();
%>
<%
/*String mois = null, jourSemaine = null, error = null;*/
String result = "";
String jourN = request.getParameter("jour");

if (null != jourN) {
	int jour =  Integer.parseInt(jourN);
	
	hd.setNbOfDay(jour);
	result = hd.displayDate();
	/*if (jour > 0) {
		mois = dh.monthFromDayNumber(jour);
		jourSemaine = dh.dayOfWeekFromDayNumber(jour);
	} else {
		 error = "<p class=\"error\">Veuillez saisir un nombre entier positif.</p>";
		 jourN = "";
	}*/
}
%>
<main role="main" class="container">
	<form method="post">
		<%--<% if (null != error) out.print(error); %>--%>
		<label>Choisir un numéro de jour de l'année [1-365] : <input type="number" value="<%= jourN %>" name="jour"/></label>
		<button type="submit">Valider</button>
	</form>
	<%= result %>
	<%--<% if (null != mois && null != jourSemaine) { out.print(getResultHtml(mois, jourSemaine)); } %>--%>
</main><!-- /.container -->