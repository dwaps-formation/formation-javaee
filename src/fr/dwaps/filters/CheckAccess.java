package fr.dwaps.filters;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(
	filterName="CheckAccess",
	value="/*",
	dispatcherTypes=DispatcherType.REQUEST
)
public class CheckAccess implements Filter {
	private String[] pseudos;
	private String[] pwds;
	
	public static boolean userAllowed;

	@Override
	public void init(FilterConfig config) throws ServletException {
		InputStream fileUsers = config.getServletContext().getResourceAsStream("/WEB-INF/users.properties");
		if (null != fileUsers) {
			Properties prop = new Properties();
			try {
				prop.load(fileUsers);
				String allPseudos = prop.getProperty("pseudos");
				String allPasswds = prop.getProperty("pwds");
				pseudos = allPseudos.split("#");
				pwds = allPasswds.split("#");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String pseudoClient = "", pwdClient = "";
		
		if (!CheckAccess.userAllowed) {
			if (null != this.pseudos && null != this.pwds) {
				
				pseudoClient = request.getParameter("pseudo");
				pwdClient = request.getParameter("pwd");
				
				if (null != pseudoClient && null != pwdClient) {
					for (int i = 0; i < pseudos.length; i++) {
						if (pseudos[i].equals(pseudoClient) && pwds[i].equals(pwdClient)) {
							CheckAccess.userAllowed = true;
						}
					}
				}
			}
		}
		
		if (!CheckAccess.userAllowed) {
			request.getRequestDispatcher("WEB-INF/checkaccess.jsp").forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
		
	}


	@Override
	public void destroy() {}
}
