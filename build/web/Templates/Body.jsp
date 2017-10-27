<%-- 
    Document   : Body
    Created on : 27 oct. 2017, 12:12:48
    Author     : Adrien
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="fr.AdrienBourgon.Classes.*" %>
<%! HandlerDate HD = new HandlerDate(); %>
<%
    String Date = "";
    if(request.getParameter("Days") != null)
    {
        String S = request.getParameter("Days");
        if(S.length() > 0)
        {
            try {
            int Days = Integer.valueOf(S);
            HD = new HandlerDate();
            Date = HD.displayDate(Days);
            }
            catch (Exception e)
            { }
        }
    }
%>
<div>    
    <form method="get" action="#" >
        <input type="number" id="Days" name="Days" placeholder="Day of the year"/>
        <input type="submit" value="Envoyer" />
    </form>
    <div>
        <p><%= Date %></p>
    </div>
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, voluptatem, saepe, tempore voluptates nostrum recusandae qui quas accusantium animi iste amet vitae dignissimos quo sit voluptas autem laboriosam natus aliquid!</div>
    <div>Quas, omnis, necessitatibus, nobis, quia assumenda dolorem nam pariatur ullam aspernatur enim ducimus eligendi repellat aut quaerat voluptates id ex dolorum sed perspiciatis laborum ut incidunt magnam iste ipsam quis?</div>
    <div>Aspernatur, saepe, dolore, nisi, ut totam fugit velit natus eligendi ipsam quasi impedit ab tempore! Adipisci, quas, illo, optio, natus sunt architecto voluptate cupiditate ipsum quia tempore dolor perspiciatis assumenda.</div>
    <div>Iusto deserunt laborum ad esse nam deleniti quaerat! Itaque, optio, ipsam, consectetur quae quod eos minima distinctio dolore odit voluptates natus asperiores doloremque neque officia labore nisi aut maxime accusantium!</div>
</div>
