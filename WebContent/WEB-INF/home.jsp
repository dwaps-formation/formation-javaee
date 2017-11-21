<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Arrays" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="perso" %>
    
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
		  .groupes-admin label {
		      cursor: pointer;
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
					                       id="${contact.nom}${groupe}"
					                       value="${groupe}" />
					                       <label for="${contact.nom}${groupe}">
					                       <perso:capitalizeFirstLetter data="${groupe}" result="groupe">
					                           ${groupe}
					                       </perso:capitalizeFirstLetter>
				                           </label>
                                        <br />
						            </c:if>
						        </c:forEach>
                                <c:choose>
                                      <c:when test="${contact.groupes.size() == fn:length(groupes)}">
                                            <a href="<c:url value='/home/${contact.nom}/resetGroupes'/>">Reset</a>
                                      </c:when>
                                      <c:otherwise>
                                            <button type="submit">Ok</button>
                                      </c:otherwise>
                                </c:choose>
							</form>
		              		</td>
		              		<td>
		              		<c:forEach items="${contact.groupes}" var="groupe">
				                ${groupe.definition}
				                <br />
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











