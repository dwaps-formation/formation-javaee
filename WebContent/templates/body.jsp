<%@ page import="fr.dwaps.classes.HandlerDate" %>

<div id="wrapper">
    <div id="home-section" class="section shown">
    <div class="card">
        <div class="door"></div>
        <h1>Entrée</h1>
        <p>App de calcul de date</p>
    </div>
    <audio hidden="true">
        <source src="./resources/audio/grincement-porte.mp3" type="audio/mp3">
    </audio>
</div>

<div id="app-section" class="section">
    <div class="card">
        <form>
            <input type="number" name="nbDay">
            <br>
            <button type="submit">Go !</button>
        </form>
        <div id="results">
			<%!
			HandlerDate handlerDate = new HandlerDate();
			int nbDay = 0;
			%>
			<%
			String queryString = (String) request.getParameter("nbDay");
			
			try {
			    nbDay = Integer.parseInt(queryString);
			} catch (NumberFormatException e) {
			       System.out.println("JSP ERROR : La conversion en int n'a pas pu se faire");
			}
			
			String message = handlerDate.calculDate(nbDay);
			%>
			<%= message %>
        </div>
    </div>
</div>
</div>