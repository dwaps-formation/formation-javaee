<%@ page
	language="java"
	extends="org.apache.jasper.runtime.HttpJspBase"
	pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"
	import="fr.cyril.classes.HandlerDate"
	
	%>



			<div id="wrapper">
			<div class="containerNews">
			<center>
			<b><u>hello world</b></u></center><br> ceci est le body !<br>&nbsp<br>
			
			<%! HandlerDate str = new HandlerDate(); %> <!-- creation d'une instance de classe HandlerDate qui s'appelle str  -->
			
			<%
			str.setNbOfDay(123); // appel du setters setNbOfDay
			str.displayDate(); // appel a la methode displayDate via son instance de classe str
			
			String resultat = str.getDateResult(); // recupere dans la variable resultat le rendu de mon getters resultStr
			out.println(resultat);  // affiche le resultat de resultat
			%> <!--  -->
			<% %> <!--  -->
			</center></div></div>
			<br>&nbsp<br>