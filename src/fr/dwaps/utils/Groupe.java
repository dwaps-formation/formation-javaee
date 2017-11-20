package fr.dwaps.utils;

public enum Groupe {
	CONTACTS("Mes contacts"),
	AMIS("Mes amis"),
	FAMILLE("Ma famille"),
	COLLEGUES("Mes collègues");
	
	private String str;
	
	Groupe(String str) {
		this.str = str;
	}
	
	public String definition() {
		return str;
	}
}
