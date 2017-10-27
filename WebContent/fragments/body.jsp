<%@ page 
	language="java" 
	contentType= "text/html;charset = UTF-8"
	import = "com.crexos.calendrier.date.HandlerDate"	
%>
<div id = "wrapper">
	<!-- Mon Application -->
	<h3>Calendrier</h3>	
	<form method="POST" action="${pageContext.request.contextPath}/home">
         <table>
            <tr>
               <td>Num&eacute;ro du jour</td>
               <td><input type="number" name="numDay" value= "" /></td>
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
		out.println("<p>" + monCalendrier.displayDate(Integer.valueOf(request.getParameter("numDay"))) + "</p>");
	%>
</div>