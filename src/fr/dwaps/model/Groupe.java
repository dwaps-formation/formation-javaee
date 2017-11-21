package fr.dwaps.model;

public enum Groupe {
	CONTACTS("Mes contacts"),
	AMIS("Mes amis"),
	FAMILLE("Ma famille"),
	COLLEGUES("Mes collègues");
	
	String str;
	
	Groupe(String str) {
		this.str = str;
	}
	
	public String getDefinition() {
		return str;
	}
}
