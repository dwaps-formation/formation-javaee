package fr.dates.classes;

public class HandlerDate {
	private final int ARRAY_OF_MONTHS = 0;
	private final int ARRAY_OF_DAYS = 1;
	private final int MONTH_31DAYS = 31;
	private final int MONTH_30DAYS = 30;
	
	public boolean ACTIVE_DEBUG_MODE = false;
	
	private String datesBuilder[][] = {
		{ "", "janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre" },
		{ "", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche" }
	};
	
	private int nbOfDay;
	
	public String displayDate(int nbOfDay) {
		this.nbOfDay = nbOfDay;
		int iMonth = 0, iDay = 0, dayNumber = 0; // iMonth, iDay => index
		String resultStr = "Le %d�me jour correspond au %s %s %s.\n";
		
		if (nbOfDay >= 1 && nbOfDay <= 366) {
			
			iMonth = searchMonth(); // récupère l'index du mois
			dayNumber = searchDayNumber(iMonth); // calcul le numéro de jour dans son mois
			iDay = searchDay(); // récupère l'index du jour
			
//				 Affichage du résultat final
			if (nbOfDay == 1) resultStr = resultStr.replace("�me", "er");
			String res = String.format(
				resultStr,
				nbOfDay,
				datesBuilder[ARRAY_OF_DAYS][iDay],
				(dayNumber == 1 ? dayNumber + "er" : dayNumber),
				datesBuilder[ARRAY_OF_MONTHS][iMonth]
			);
			return res;
			
		} else {
			return "La valeur saisie n'est pas correcte...\n";
		}
		
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
				String monthName = datesBuilder[ARRAY_OF_MONTHS][i]; // for debug
				int typeOfMonth; // for debug
				
				if (i % 2 == 0) {
					typeOfMonth = (julyToJanuary ? MONTH_30DAYS : MONTH_31DAYS);
					daysFromFirst -= julyToJanuary ? MONTH_30DAYS : MONTH_31DAYS;
				} else {
					typeOfMonth = (julyToJanuary ? MONTH_31DAYS : MONTH_30DAYS);
					daysFromFirst -= julyToJanuary ? MONTH_31DAYS : MONTH_30DAYS;
				}
				
				if (i == 2) { // cas de février
					typeOfMonth = MONTH_30DAYS-1;
					daysFromFirst++;
				}
				
				if (ACTIVE_DEBUG_MODE) {
					debug(
						monthName,
						typeOfMonth,
						daysFromFirst
					);
				}
				
				dayNumber = daysFromFirst;
			}
		}
		
		return dayNumber;
	}
	
	private void debug(String monthName, int daysOfMonth, int reste) {
		System.out.println("   On a retiré " + monthName + " (" + daysOfMonth + " jours) => Il reste " + reste + " jours.");
	}
}