<%@ page 
	language="java" 
	contentType= "text/html;charset = UTF-8"
	import = "com.crexos.calendrier.date.HandlerDate"
	errorPage = "/error.jsp"
%>
<div id = "wrapper">
	<!-- Mon Application -->
	<h3>Calendrier</h3>	
	<form method="POST" action="${pageContext.request.contextPath}/home">
         <table>
            <tr>
               <td>Num&eacute;ro du jour</td>
               <td><input type="text" name="numDay" value= "" /></td>
            </tr>
            <tr>
               <td colspan="2">                   
                   <input type="submit" value="Envoyer" />
               </td>
            </tr>
         </table>
      </form>
	<%!
		//Cette portion de code est appelé uniquement lors de l'initialisation de la servlet
		HandlerDate monCalendrier = new HandlerDate();
	%>	

	<%
	if(request.getParameter("numDay") != null)
	{
		try
		{
			out.println("<p>" + monCalendrier.displayDate(Integer.valueOf(request.getParameter("numDay"))) + "</p>");
		}
		catch(Exception e)
		{
			out.println("<p>Le num&eacute;ro de jour doit &ecirc;tre compris entre 1 et 366.</p>");
		}
	}
	%>
	
	<h3>Publicit&eacute;</h3>
		<form method="GET" action="${pageContext.request.contextPath}/pub">
			<input type="text" placeholder="Votre age..." name="age" />
			<br />
			<button type="submit">Go !</button>
		</form>	
</div>