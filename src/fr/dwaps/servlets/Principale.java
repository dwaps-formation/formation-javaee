package fr.dwaps.servlets;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dwaps.beans.Adresse;
import fr.dwaps.beans.Personne;
import fr.dwaps.beans.Repertoire;
import fr.dwaps.utils.Constantes;

public class Principale extends HttpServlet implements Constantes {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_HOME = "/WEB-INF/home.jsp";
       
    public Principale() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		List<Repertoire> reps = (List<Repertoire>) getServletContext().getAttribute("reps");
		int cpt = 0;
		
		if (null == reps) {
			reps = new ArrayList<Repertoire>();
			
			reps.add(new Repertoire("Répertoire principale"));
			reps.add(new Repertoire("Répertoire secondaire"));
			
			Personne personne;
			for (String[][] contact : CONTACTS) {
				personne = new Personne(
					contact[1][0],
					contact[1][1],
					contact[1][2],
					new Adresse(
						contact[0][0],
						contact[0][1],
						contact[0][2]
						)
				);
				
				reps.get(cpt%2).addPersonne(personne);
				cpt++;
			}
			
			getServletContext().setAttribute("reps", reps);
		}

		
		String uri = request.getRequestURI();
		boolean uriContainsFavori = uri.contains("favori");
		String[] fragmentsUri = uri.split("/");
		String nameOfPerson = uriContainsFavori? fragmentsUri[fragmentsUri.length-2] : fragmentsUri[fragmentsUri.length-1];
		nameOfPerson = URLDecoder.decode(nameOfPerson, "UTF-8");
		boolean redirect = false;
		
		for (Repertoire rep : reps) {
			for (Personne p : rep.getListePersonnes()) {
				if (nameOfPerson.equals(p.getNom())) {
					p.setFavori(uriContainsFavori);
					redirect = true;
					response.sendRedirect(getServletContext().getContextPath()+"/home");
				}
			}
		}
		
		if (!redirect) getServletContext().getRequestDispatcher(PAGE_HOME).forward(request, response);
	}
		
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}








