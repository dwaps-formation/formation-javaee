package fr.dwaps.model.beans;

public class Adresse {
	private String voie;
	private String cp;
	private String ville;
	
	// Constructor
	public Adresse() {}
	public Adresse(String voie, String cp, String ville) {
		setVoie(voie);
		setCp(cp);
		setVille(ville);
	}
	
	// Getters and setters
	public String getVoie() {
		return voie;
	}
	public void setVoie(String voie) {
		this.voie = voie;
	}
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	@Override
	public String toString() {
		return "class " + this.getClass().getName()
			+ "\n\tPropriété voie : " + voie
			+ "\n\tPropriété cp : " + cp
			+ "\n\tPropriété ville : " + ville;
	}
}














