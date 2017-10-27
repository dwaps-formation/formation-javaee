<%@ page import="org.hezzel.formation.tp.*" %>
<%@ page errorPage="templates/containerError.jsp" %>
<!-- CONTAINER -->
<div id="container">
  <h1>TP Webdynamic - page principale</h1>
  <%!
    DateResolver resolver = new DateResolver(true);
    int day;
  %>
  <%
    if(request.getParameterMap().containsKey("day"))
    {
      day = Integer.parseInt(request.getParameter("day"));
      System.err.println(day);
      %> <div id="result"><%= resolver.getMonthName(day) %></div>
         <div id="again"><a href="home">Recommencer</a></div> <%
    }
    else
    {
      %> <form action="home"><fieldset><input name="day" type="number" /></fieldset><fieldset><input type="submit" /></fieldset></form> <%
    }
  %>
</div>