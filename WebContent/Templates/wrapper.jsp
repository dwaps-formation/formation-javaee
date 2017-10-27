<div id="body">
	<div id="lbody">
	</div>
	<div id="mbody">
	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
	</div>
	<div id="rbody">
	<%! String resultat = "Calcul date"; 
	class Chien{
		private int age;
		public Chien(int age){
			this.age = age;
		}
		public int edit(){
			return age;
		}
	}
	
	
	%>
	<% resultat += " à votre choix";
		Chien chien = new Chien(3);
		
	%>
	<%= resultat %>
	<%= "Choisir un numero de jour de l'annee [1-365] "%>
	<%= chien.edit() %>
	</div>
</div>