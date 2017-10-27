<%@ page import="fr.youcef.classes.HandlerDate" %>

	<!-- BODY -->
	
	<body>
	<div id="wrapper">
	<h1>MON APPLICATION ! </h1><br><br>
	
	
	
	<!-- DECLARATION VARIABLE = INITIALISATION  METHODE INIT-->
	
	<%! 	
		HandlerDate handlerDate = new HandlerDate(); %>
		
		
	<!-- CODE  = TRANSFORMATION  METHODE SERVICE -->
	 	
	<% 	String parameter = request.getParameter("numero");
		if(parameter != null && parameter != "" ){
			handlerDate.setNbOfDay(Integer.parseInt(parameter));
			handlerDate.ACTIVE_DEBUG_MODE = true;
			String returnStr = handlerDate.displayDate();
			out.print(returnStr);	
		}
	%>

		<form name="form1" method="get">
	 					votre numero : <input type="number" name="numero" value="<% if(parameter != null) out.print(parameter);  %>">
	 		             <br>  <br><input type="submit" value="Envoyer">
	  
		</form>
	

	
	
	</div>
	
	
	</body>