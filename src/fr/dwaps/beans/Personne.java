package fr.dwaps.beans;

import java.util.HashSet;
import java.util.Set;

import fr.dwaps.utils.Groupe;

public class Personne {
	private String nom;
	private String prenom;
	private String tel;
	private Adresse adresse;
	private boolean favori;
	private Set<Groupe> groupes;
	
	public Personne() {
		groupes = new HashSet<Groupe>();
		groupes.add(Groupe.CONTACTS);
	}
	public Personne(String nom, String prenom, String tel, Adresse adresse) {
		this();
		setNom(nom);
		setPrenom(prenom);
		setTel(tel);
		setAdresse(adresse);
		groupes.add(Groupe.CONTACTS);
	}
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Adresse getAdresse() {
		return adresse;
	}
	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}
	public boolean isFavori() {
		return favori;
	}
	public void setFavori(boolean favori) {
		this.favori = favori;
	}
	public Set<Groupe> getGroupes() {
		return groupes;
	}
	public void addGroupe(Groupe groupe) {
		this.groupes.add(groupe);
	}
	public void setGroupes(Set<Groupe> groupes) {
		this.groupes = groupes;
	}
}
