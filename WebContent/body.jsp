		<%@ page import="fr.dateHandler.classes.HandlerDate"%>
		<div id="body">
			<div id="lbody">
			</div>
			<div id="mbody">
				<div class="container">
					<form id="contact" action="index.jsp">
						<h3>Date Generater </h2>
						<h4>Calcul de date à partir de chiffre fourni entre 1 et 365.</h3>
					
						<fieldset>
			  				<input placeholder="Chiffre entre 1 et 365" type="number" name="quantity" min="1" max="365" value = "int" size="40">
			  				
		  				</fieldset>
	  				    
      						<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
    				
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
			<div id="rbody">
			</div>
		</div>