<%@ page
    language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Page d'accueil</title>
        <style>
          body, h1 {
              text-align: center;
          }
          a {
            text-decoration: none;
          }
          table {
              border-collapse: collapse;
              margin: auto;
          }
          th, td {
              width: 200px;
              padding: 10px;
              border: 1px solid gray;
          }
        </style>
    </head>
    

    <body>
    
       <c:forEach items="${reps}" var="rep">
       <c:if test="${!empty rep.listePersonnes}">
           <h1>${ rep.nom == '' ? 'Pas de nom' : rep.nom }</h1>
           
           <table>
               <tr>
                    <th>Nom et prénom</th>
                    <th>Adresse</th>
                    <th>Numéro de téléphone</th>
               </tr>
               <c:forEach items="${rep.listePersonnes}" var="contact">
               <tr>
                   <td>
                       <c:out value="${contact.nom += ' ' += contact.prenom}">Non renseigné</c:out>
                       <a href='<c:url value="/home${contact.favori ? '' : '/favori'}"/>'>
                       <c:choose>
                          <c:when test="${contact.favori}">✮</c:when>
                          <c:otherwise>✩</c:otherwise>
                       </c:choose>
                       </a>
                   </td>
                   <td>
                       ${adresse = contact.adresse; ''}
                       <c:out value="${adresse.voie}" />
                       <br />
                       <c:out value="${adresse.cp += ' ' += adresse.ville}">Non renseigné</c:out>
                   </td>
                   <td><c:out value="${contact.tel}">Non renseigné</c:out></td>
               </tr>
               </c:forEach>
           </table>
       </c:if>
       </c:forEach>
    
    </body>
</html>
