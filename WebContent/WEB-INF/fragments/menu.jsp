${ tabs = [ 'Accueil', 'Pr�sentation', 'Contact' ]; '' }

<nav>
    <ul>
        <c:forEach items="${tabs}" var="tab">
            <li>${tab}</li>
        </c:forEach>
    </ul>
</nav>