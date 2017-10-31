package fr.dwaps.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dwaps.beans.User;
import fr.dwaps.classes.HandlerDate;
import fr.dwaps.utils.Constants;

public class Processing extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
       
    public Processing() {
        super();
    }
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		super.service(request, response);
    		session = request.getSession();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setInputNames(request);
		calculDateFromNumberOfDay(request);
		
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getNamedDispatcher("Home");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		createUser(request);
		doGet(request, response);
	}
	
	private void setInputNames(HttpServletRequest request) {
		List<String> inputNames = new ArrayList<String>();
		inputNames.add(Constants.INPUT_FIRSTNAME);
		inputNames.add(Constants.INPUT_LASTNAME);
		inputNames.add(Constants.INPUT_AGE);
		request.setAttribute("inputNames", inputNames);
	}
	
	private void calculDateFromNumberOfDay(HttpServletRequest request) {
		HandlerDate handlerDate = new HandlerDate();
		String nbDayStr = (String) request.getParameter("nbDay");
		String message;
		int nbDay = 0;
		
		if (null != nbDayStr) {
			try {
				nbDay = Integer.parseInt(nbDayStr);
				message = handlerDate.calculDate(nbDay);
				request.setAttribute("message", message);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void createUser(HttpServletRequest request) {
		User user = new User();
		
		// Récupération des valeurs des champs
		String firstname = request.getParameter(Constants.INPUT_FIRSTNAME);
		String lastname = request.getParameter(Constants.INPUT_LASTNAME);
		int age = -1; // Par défaut, un âge improbable...
		try {
			age = Integer.parseInt(request.getParameter(Constants.INPUT_AGE));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println("La valeur du champ age n'a pas pu être convertie en int.");
		}
		
		// Vérification des données récupérées
		boolean firstnameIsOk = checkName(firstname);
		boolean lastnameIsOk = checkName(lastname);
		boolean ageIsOk = (age > 0 && age < 130);
		
		// Si au moins une valeur n'est pas correct, on va pas plus loin...
		if (!firstnameIsOk || !lastnameIsOk || !ageIsOk) {
			return;
		}
		
		// ... sinon on peut créer notre user
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setAge(age);
		
		// On ajoute l'user à la session pour le rendre disponible
		session.setAttribute("user", user);
	}
	
	private boolean checkName(String name) {
		return (null != name && !name.isEmpty() && name.length() > 1 && name.length() < 50);
	}
}
