package fr.fred.classes;

public class DateHandler {
	private final String[][] dateBuilder = {
			{"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"},
			{"Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"}
	};
	
	public String monthFromDayNumber(int jour) {
		if (jour > 366) jour = jour % 366;
		
		int[] nbJoursMois = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		int sum = 0;
		int indiceMois = 0;
		for (int i = 0; i < 12; i++) {
			sum += nbJoursMois[i];
			if(sum >= jour) {
				indiceMois = i;
				break;
			}
		}
		
		return this.dateBuilder[0][indiceMois];
	}

	public String dayOfWeekFromDayNumber(int jour) {
		return this.dateBuilder[1][(jour - 1) % 7];
	}
}
