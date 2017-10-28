<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="fr.arez.classes.HandlerDate"%>
<!-- BODY -->


<!-- TODO 1/ créer une instance de handlerdate()
		  2/ simuler une saisie utilisateur
		  3/ appel à la méthode diplayDate()
		  4/ récupérer le résultat (int)
		  5/ convertir int -> string
		  6/ afficher le résultat.
 -->

<div id="wrapper">
	<h1>Mon Application</h1>
	<form method="post" action="${pageContext.request.contextPath}/home">
		<label>Veuillez entrer le numéro d'un jour : </label> <input
			type="text" name="nbJour" />
	</form>
	<!-- déclaration de l'instance de la classe HandlerDate -->
	<%! HandlerDate handler = new HandlerDate(); %>
	<!-- simulation d'une saisie utilisateur -->
	<!--  avec une sortie ecran aec une apple à la méthode displayDate de l'objet handler -->
	<!-- request.getParameter  pour un seul parametre, ou request.getParameterValues 
	pour un tableau de valuer en string -->
	<%
	String temp = request.getParameter("nbJour");
	if (temp!=null && temp!="") {
	int nbJour = Integer.parseInt(temp);
	handler.setNbOfDay(nbJour);
		out.print(handler.displayDate()); }
	%>
</div>
<!-- faire une gestion d'exeption en redirigeant vers une autre page -->