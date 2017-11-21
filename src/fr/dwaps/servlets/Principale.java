package fr.dwaps.servlets;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static fr.dwaps.model.Constantes.*;

import fr.dwaps.filters.CheckAccess;
import fr.dwaps.model.Groupe;
import fr.dwaps.model.beans.Adresse;
import fr.dwaps.model.beans.Personne;
import fr.dwaps.model.beans.Repertoire;

public class Principale extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_HOME = "/WEB-INF/home.jsp";
       
    public Principale() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean redirect = true;
		
		if (request.getRequestURI().contains("deconnexion")) {
			CheckAccess.userAllowed = false;
		} else {
			@SuppressWarnings("unchecked")
			List<Repertoire> reps = (List<Repertoire>) getServletContext().getAttribute("reps");
			
			if (null == reps) {
				reps = new ArrayList<Repertoire>();
				
				reps.add(new Repertoire("Répertoire principale"));
				reps.add(new Repertoire("Répertoire secondaire"));
				
				int cpt = 0;
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
				getServletContext().setAttribute("groupes", Groupe.values());
			}
			
			redirect = checkIfIsFavori(request, reps);
			if (!redirect) redirect = checkIfResetGroupes(request, reps);
		}
		
		if (!redirect) {
			getServletContext().getRequestDispatcher(PAGE_HOME).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath()+"/home");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		List<Repertoire> reps = (ArrayList<Repertoire>) getServletContext().getAttribute("reps");
		String uri = request.getRequestURI();
		String[] tab = uri.split("/");
		String nomPersonne = tab[tab.length-1];
		nomPersonne = URLDecoder.decode(nomPersonne, "UTF-8");
		String[] groupesStr = request.getParameterValues("choixGroupes");
		Set<Groupe> groupes = new HashSet<Groupe>();
		
		if (null != groupesStr) {
			for (String str : groupesStr) {
				groupes.add(Groupe.valueOf(str));
			}
			
			for (Repertoire rep : reps) {
				for (Personne p : rep.getListePersonnes()) {
					if (nomPersonne.equals(p.getNom())) {
						for (Groupe g : groupes) {
							p.addGroupe(g);
						}
					}
				}
			}
		}
		
		response.sendRedirect(request.getContextPath()+"/home");
	}
	
	private boolean checkIfIsFavori(HttpServletRequest req, List<Repertoire> rs) throws UnsupportedEncodingException {
		String uri = req.getRequestURI();
		boolean uriContainsFavori = uri.contains("favori");
		String[] tab = uri.split("/");
		String nomPersonne = uriContainsFavori ? tab[tab.length-2] : tab[tab.length-1];
		nomPersonne = URLDecoder.decode(nomPersonne, "UTF-8");
		
		for (Repertoire rep : rs) {
			for (Personne p : rep.getListePersonnes()) {
				if (nomPersonne.equals(p.getNom())) {
					p.setFavori(uriContainsFavori);
					return true;
				}
			}
		}
		
		return false;
	}
	
	public boolean checkIfResetGroupes(HttpServletRequest request, List<Repertoire> reps) throws UnsupportedEncodingException {
		String uri = request.getRequestURI();
		boolean resetGroupes = uri.contains("resetGroupes");
		String[] tab = uri.split("/");
		String nomPersonne = resetGroupes ? tab[tab.length-2] : "";
		nomPersonne = URLDecoder.decode(nomPersonne, "UTF-8");

		if (null != nomPersonne && !nomPersonne.isEmpty()) {
			for (Repertoire rep : reps) {
				for (Personne p : rep.getListePersonnes()) {
					if (nomPersonne.equals(p.getNom())) {
						if (resetGroupes) {
							p.getGroupes().clear();
							p.addGroupe(Groupe.CONTACTS);
							return true;
						}
					}
				}
			}
		}
		
		return false;
	}
}








