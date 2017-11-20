package fr.dwaps.javase;

import java.util.List;

import fr.dwaps.beans.Adresse;
import fr.dwaps.beans.Personne;
import fr.dwaps.beans.Repertoire;
import fr.dwaps.utils.Constantes;

public class Principale extends Object implements Constantes {
	public static void main(String[] args) {
		Repertoire repPrincipal = new Repertoire("Répertoire principal");
		
		Personne personne;
		Adresse adresse;
		
//		Création des contacts et ajout dans le répertoire
		for (String[][] contact : CONTACTS) {
			adresse = new Adresse(contact[0][0], contact[0][1],  contact[0][2]);
			personne = new Personne(contact[1][0], contact[1][1], contact[1][2], adresse);
			repPrincipal.addPersonne(personne);
		}
		
		
//		Affichage du/des répertoire(s)
		List<Personne> list = repPrincipal.getListePersonnes();
		
		if (!list.isEmpty()) {
			System.out.println("*** " + repPrincipal.getNom() + " ***");
			System.out.println();
			for (Personne p : repPrincipal.getListePersonnes()) {
				System.out.println("> " + p.getNom() + " " + p.getPrenom());
				adresse = p.getAdresse();
				System.out.print("\t" + adresse.getVoie());
				System.out.print(" " + adresse.getCp());
				System.out.println(" " + adresse.getVille());
				System.out.println();
			}
		}
	}
}








