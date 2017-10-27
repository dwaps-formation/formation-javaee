<%!
String[][] dateBuilder = {
		{"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"},
		{"Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"}
};
public String monthFromDayNumber(int jour, String[][] dateBuilder) {
	if (jour > 366) jour = jour % 366;
	
	int[] nbJoursMois = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	int sum = 0;
	int indiceMois = 0;
	for (int i = 0; i < 12; i++) {
		sum += nbJoursMois[i];
		if(sum >= jour) {
			indiceMois = i;
			break;
		}
	}
	
	return dateBuilder[0][indiceMois];
}

public String dayOfWeekFromDayNumber(int jour, String[][] dateBuilder) {
	return dateBuilder[1][(jour - 1) % 7];
}
%>

<%
String jourN = request.getParameter("jour");
%>
<main role="main" class="container">
	<form method="post">
		<label>Saisissez un nombre : <input type="number" value="<%= jourN %>" name="jour"/></label>
		<button type="submit">Valider</button>
	</form>
	<%
	if (null != jourN) {
		int jour =  Integer.parseInt(jourN);
		
		String mois = monthFromDayNumber(jour, dateBuilder);
		String jourSemaine = dayOfWeekFromDayNumber(jour, dateBuilder);
		
		out.print("Mois = " + mois + "<br />");
		out.print("Jour = " + jourSemaine);
	}
	%>
</main><!-- /.container -->