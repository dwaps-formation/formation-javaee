<%@ page language="java" extends="org.apache.jasper.runtime.HttpJspBase"
	pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"
	import="fr.cyril.classes.HandlerDate"%>



<div id="wrapper">
	<div class="containerNews">
		<center>
			<b><u>hello world</b></u>
		</center>
		<br> ceci est le body !<br>&nbsp<br>

		<%! HandlerDate str = new HandlerDate(); %>
		<!-- creation d'une instance de classe HandlerDate qui s'appelle str  -->

		<%! int valeuRentrer ;%>
		<!-- initialise une variable int -->

		<!-- form method="post" action="/Jee-1/test"-->
		<form method="post" action="${pageContext.request.contextPath }/test">
			<label for="nom">Entrer une valeur de 1 à 366 : </label> <input
				type="text" name="valeuRentrer" id="valeuRentrer"
				value="<%=valeuRentrer%>" /> <input type="submit" />

		</form>

		<%
			String valeur = request.getParameter("valeuRentrer"); // recupere la valeur entrer dans un string appeler valeur
			if (valeur != null )
				{
					try
						{
						int nb = Integer.parseInt(valeur); // cast = change string valeur en int nb 
						
						str.setNbOfDay(nb); // appel du setters setNbOfDay
						str.displayDate(); // appel a la methode displayDate via son instance de classe str
						
						String resultat = str.getDateResult(); // recupere dans la variable resultat le rendu de mon getters resultStr
						out.println(resultat);  // affiche le resultat de resultat
						}
					catch(Exception e) 
						{				
							 out.println("veuillez taper un nombre");  
						}
					
				}	
			 %>


		</center>
	</div>
</div>
<br>
&nbsp
<br>