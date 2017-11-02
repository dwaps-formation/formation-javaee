<%@ page import="fr.dateHandler.classes.HandlerDate"%>
<!--rightContent-->
	  	<div class="rightColumn">
		  	<h2>Right Column</h2>
			<div class="formWrapper">
				<h3>Date Generator</h3>
		
					<form id="form" class="topBefore">
							
							  <input id="name" type="number" name="quantity" placeholder="Chiffre entre 1 et 365" min="1" max="365" value = "int">

				  			<input id="submit" type="submit" value="GO!">					  
					
					</form>
<%! String result; %>
<%
	String paramquantity = request.getParameter("quantity");
	result ="";
	if(paramquantity != null) {
		
		HandlerDate findDate = new HandlerDate();
		int quantity = Integer.parseInt(paramquantity);
		result = findDate.displayDate(quantity);
	}
%>
					<p><%= result%></p>
			</div>
	  	</div>

