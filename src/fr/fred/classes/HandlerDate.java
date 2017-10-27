package fr.fred.classes;

public class HandlerDate {
	private final int ARRAY_OF_MONTHS = 0;
	private final int ARRAY_OF_DAYS = 1;
	private final int MONTH_31DAYS = 31;
	private final int MONTH_30DAYS = 30;
	
	private String datesBuilder[][] = {
		{ "", "janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre" },
		{ "", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche" }
	};
	
	private int nbOfDay = 0;
	
	public void setNbOfDay(int nbOfDay) {
		this.nbOfDay = nbOfDay;
	}
	
	public String displayDate() {
		int iMonth = 0, iDay = 0, dayNumber = 0; // iMonth, iDay => index
		String resultStr = "Le %dème jour correspond au %s %s %s.\n";
		String returnStr = "";
		
		if (nbOfDay >= 1 && nbOfDay <= 366) {
			
			iMonth = searchMonth(); // récupère l'index du mois
			dayNumber = searchDayNumber(iMonth); // calcul le numéro de jour dans son mois
			iDay = searchDay(); // récupère l'index du jour
			
			// Retourne résultat final
			if (nbOfDay == 1) resultStr = resultStr.replace("ème", "er");
			
			returnStr = String.format(
				resultStr,
				nbOfDay,
				datesBuilder[ARRAY_OF_DAYS][iDay],
				(dayNumber == 1 ? dayNumber + "er" : dayNumber),
				datesBuilder[ARRAY_OF_MONTHS][iMonth]
			);
			returnStr += " (Sous-entendu : lundi est le premier jour de l'année.)";
			
		} else {
			returnStr = "<span class=\"error\">La valeur saisie n'est pas correcte...</span>";
		}
		
		return returnStr;
	}
	
	private int searchMonth() {
		int cpt31Days = 1, cpt30Days = 0, iMonth = 0;
		final boolean[] is30DaysMonth = {
			false, // Janvier
			true, // Février (30-1 !!!)
			false, // Mars
			true, // Avril
			false, // Mai
			true, // Juin
			false, // Juillet
			false, // Août
			true, // Septembre
			false, // Octobre
			true, // Novembre
			false // Décembre
		};
		
		stop : for (int i = 0; i < is30DaysMonth.length; i++) {
			switch (i) {
				case 0:
					// Si l'utilisateur a saisi 1..31, le jour appartient au mois de janvier
					if (nbOfDay <= MONTH_31DAYS) { // Simplification de la condition : l'incrémentation de cpt31Days --> 1 à l'initialisation
						iMonth = 1;
						break stop;
					}
					break;
				default:
					if (nbOfDay <= (MONTH_31DAYS*(is30DaysMonth[i] ? cpt31Days : ++cpt31Days) + MONTH_30DAYS*(is30DaysMonth[i] ? ++cpt30Days : cpt30Days)-1)) {
						iMonth = i+1;
						break stop;
					}
			}
		}
		
		return iMonth;
	}
	
	private int searchDay() {
		int result = nbOfDay % 7;
		return result != 0 ? result : 7;
	}
	
	private int searchDayNumber(int iMonth) {
		int dayNumber;
		int daysFromFirst = dayNumber = nbOfDay;
		
		if (nbOfDay > MONTH_31DAYS) { // Si la saisie utilisateur dépasse le mois de janvier...
			for (int i = iMonth-1; i > 0; i--) {
				boolean julyToJanuary = i < 8;
				
				if (i % 2 == 0) {
					daysFromFirst -= julyToJanuary ? MONTH_30DAYS : MONTH_31DAYS;
				} else {
					daysFromFirst -= julyToJanuary ? MONTH_31DAYS : MONTH_30DAYS;
				}
				
				if (i == 2) { // cas de février
					daysFromFirst++;
				}
				
				dayNumber = daysFromFirst;
			}
		}
		
		return dayNumber;
	}
}