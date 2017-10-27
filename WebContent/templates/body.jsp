<%@ page import="fr.youcef.classes.HandlerDate" %>

	<!-- BODY -->
	
	<body>
	<div id="wrapper">
	MON APPLICATION<br>
	<p>
		
	<%! public class PremiereClasse {

		public static void main(String[] args) {
			
			Scanner sc = new Scanner(System.in);
			HandlerDate handlerDate = new HandlerDate();
			boolean run = true;
			
			while (run) {
				handlerDate.ACTIVE_DEBUG_MODE = true;	
				handlerDate.displayDate(sc);
				
				System.out.print("Voulez-vous recommencer [On] ? ");
				sc.nextLine();
				String userResponse = sc.nextLine();
				
				if (userResponse.equals("n")) {
					break;
				}
			}
			
			System.out.print("A bientôt ! :)");
			sc.close();
		}

	} %>
	<form name="form1" method="post" enctype="text/plain">
  <pre>
  
 
  <b>Votre Numero</b> <input type="text" name="numero" >
 
	              <input type="submit" value="   Envoyer   " >
  </pre>
</form>
	<%= "ARRAY_OF_MONTHS"  %>
	</p>
	
	
	</div>
	
	
	</body>