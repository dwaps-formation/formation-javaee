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
	private String pseudo;
	private String pwd;
	
	public static boolean userAllowed;

	@Override
	public void init(FilterConfig config) throws ServletException {
		InputStream fileUsers = config.getServletContext().getResourceAsStream("/WEB-INF/users.properties");
		if (null != fileUsers) {
			Properties prop = new Properties();
			try {
				prop.load(fileUsers);
				pseudo = prop.getProperty("pseudo");
				pwd = prop.getProperty("passwd");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if (!CheckAccess.userAllowed) {
			if (null != this.pseudo && null != this.pwd) {
				
				
				String pseudoClient = request.getParameter("pseudo");
				String pwdClient = request.getParameter("pwd");
				
				if (null != pseudoClient && null != pwdClient) {
					if (pseudoClient.equals(this.pseudo) && pwdClient.equals(this.pwd)) {
						CheckAccess.userAllowed = true;
					} else {
						request.setAttribute("pseudo", pseudoClient);
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
