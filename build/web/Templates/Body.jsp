<%-- 
    Document   : Body
    Created on : 27 oct. 2017, 12:12:48
    Author     : Adrien
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="fr.AdrienBourgon.Classes.*" %>
<div>
    <%
        HandlerDate HD = new HandlerDate();
        if(request.getParameter("Days") != null)
        {
            String S = request.getParameter("Days");
            if(S.length() > 0)
            {
                int Days = Integer.valueOf(S);
                HD = new HandlerDate();
                out.print("<div><p>");
                out.print(HD.displayDate(Days));
                out.print("</div></p>");
            }
        }
    %>
    
    <form method="get">
        <input type="number" id="Days" name="Days" placeholder="Day of the year"/>
        <input type="submit" value="Envoyer" />
    </form>
</div>
