<div id="body">
	<div id="lbody">
	</div>
	<div id="mbody">
	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
	</div>
	<div id="rbody">
	<div class="titre">Calcul date</div>
	<%@ page 
		import ="fr.dates.classes.HandlerDate" %>

	<%
		String reponse = "";
		String strofday = request.getParameter("nbofday" );	
	%>
	<%-- strofday --%>
	
	<% 	if (strofday != null){
		int nbofday = Integer.parseInt(strofday);
		HandlerDate handler = new HandlerDate();
		reponse = handler.displayDate(nbofday);
		}else{
			reponse = "";
		}
	%>
	<form action="">
    <div>
        <label for="nbofday">Quel jour :</label>
        <input type="text" id="nbofday" name="nbofday"/>
    </div>
	<div class="button">
        <button type="submit">Envoyer</button>
    </div>
	</form>
	<br>
	<%= reponse %>
	</div>
</div>