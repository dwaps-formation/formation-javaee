package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import fr.AdrienBourgon.Classes.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/Templates/Header.jsp");
    _jspx_dependants.add("/Templates/Menu.jsp");
    _jspx_dependants.add("/Templates/Body.jsp");
    _jspx_dependants.add("/Templates/Footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Index</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/Default.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<header>\n");
      out.write("    <h1>Titre de la page</h1>\n");
      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<nav id=\"Menu\">\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"#\">Accueil</a></li>\n");
      out.write("        <li><a href=\"#\">Présentation</a></li>\n");
      out.write("        <li><a href=\"#\">Contact</a></li>\n");
      out.write("    </ul>\n");
      out.write("    <div class=\"clear\"></div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    HandlerDate HD = new HandlerDate();
    String Date = "";
    if(request.getParameter("Days") != null)
    {
        String S = request.getParameter("Days");
        if(S.length() > 0)
        {
            int Days = Integer.valueOf(S);
            HD = new HandlerDate();
            Date = HD.displayDate(Days);
        }
    }

      out.write("\n");
      out.write("<div>    \n");
      out.write("    <form method=\"get\">\n");
      out.write("        <input type=\"number\" id=\"Days\" name=\"Days\" placeholder=\"Day of the year\"/>\n");
      out.write("        <input type=\"submit\" value=\"Envoyer\" />\n");
      out.write("    </form>\n");
      out.write("    <div>\n");
      out.write("        <p>");
      out.print( Date );
      out.write("</p>\n");
      out.write("    </div>\n");
      out.write("    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae, voluptatem, saepe, tempore voluptates nostrum recusandae qui quas accusantium animi iste amet vitae dignissimos quo sit voluptas autem laboriosam natus aliquid!</div>\n");
      out.write("    <div>Quas, omnis, necessitatibus, nobis, quia assumenda dolorem nam pariatur ullam aspernatur enim ducimus eligendi repellat aut quaerat voluptates id ex dolorum sed perspiciatis laborum ut incidunt magnam iste ipsam quis?</div>\n");
      out.write("    <div>Aspernatur, saepe, dolore, nisi, ut totam fugit velit natus eligendi ipsam quasi impedit ab tempore! Adipisci, quas, illo, optio, natus sunt architecto voluptate cupiditate ipsum quia tempore dolor perspiciatis assumenda.</div>\n");
      out.write("    <div>Iusto deserunt laborum ad esse nam deleniti quaerat! Itaque, optio, ipsam, consectetur quae quod eos minima distinctio dolore odit voluptates natus asperiores doloremque neque officia labore nisi aut maxime accusantium!</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<footer>\n");
      out.write("    <p>Le footer ici.</p>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
