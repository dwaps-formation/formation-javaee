<div id="wrapper">
    <div id="home-section" class="section shown">
	    <div class="card">
	        <div class="door"></div>
	        <h1>Entrée</h1>
	        <p>App de calcul de date</p>
	    </div>
	    <audio hidden="true">
	        <source src="./resources/audio/grincement-porte.mp3" type="audio/mp3">
	    </audio>
	</div>
	
	<div id="app-section" class="section">
	    <div class="card">
	        <form action="" method="GET">
	            <input type="number" name="nbDay" placeholder="N° de jour..." autofocus>
	            <br>
	            <button type="submit">Go !</button>
	        </form>
	        <div id="results">
               <c:out value="${ message }">
                    Veuillez saisir une valeur entre 1 et 366
               </c:out>
	        </div>
	    </div>
	</div>
</div>