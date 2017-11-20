<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Arrays" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Page d'accueil</title>
		<style>
		  body, h1 {
		      text-align: center;
		      font-size: 100%;
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
		      padding: 8px;
		      border: 1px solid gray;
		  }
		  select {
		      cursor: pointer;
		  }
		  .groupes-admin {
		      font-size: 0.7em;
		  }
		  .groupes-admin form {
		      text-align: left;
		  }
		</style>
	</head>
	

	<body>
	
	   <c:forEach items="${applicationScope.reps}" var="rep">
	   <c:if test="${!empty rep.listePersonnes}">
		   <h1>${ rep.nom == '' ? 'Pas de nom' : rep.nom }</h1>
		   
		   <table>
		       <tr>
			       	<th>Nom et prénom</th>
			       	<th>Adresse</th>
			       	<th>Numéro de téléphone</th>
			       	<th>Groupes</th>
		       </tr>
		       <c:forEach items="${rep.listePersonnes}" var="contact">
		       <tr>
		           <td>
		               <c:out value="${contact.nom += ' ' += contact.prenom}">Non renseigné</c:out>
		               <a href='<c:url value="/home/${contact.nom}${contact.favori ? '' : '/favori'}"/>'>
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
		           <td>
		              <table class="groupes-admin">
		              	<tr>
		              		<td>
							<form action="<c:url value='/home/${contact.nom}'/>" method="POST">
						        <c:forEach items="${groupes}" var="groupe" varStatus="loop">
						            <c:if test="${!loop.first && !contact.groupes.contains(groupe)}">
					                   <input
					                       type="checkbox"
					                       name="choixGroupes"
					                       value="${groupe}" />
					                       ${groupe}
                                        <br />
						            </c:if>
						        </c:forEach>
							    <button type="submit">Ok</button>
							</form>
		              		</td>
		              		<td>
		              		<c:forEach items="${contact.groupes}" var="groupe">
				                ${groupe}
		              		</c:forEach>
		              		</td>
		              	</tr>
		              </table>
		           </td>
		       </tr>
		       </c:forEach>
		   </table>
	   </c:if>
	   </c:forEach>
	
	</body>
</html>











