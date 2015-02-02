package ua.divas.bean.filter;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ua.divas.bean.Login;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.Users;

public class loginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @EJB
    private UsersFacade uf;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        Login session = (Login) req.getSession().getAttribute("login");
        String url = req.getRequestURI();

        short isAdmin = 0;

        if (session == null || !session.isLogged) {
            if (url.contains("welcome.xhtml") || url.contains("registr.xhtml")) {
                resp.sendRedirect(req.getServletContext().getContextPath() + "/index.xhtml");
            } else {
                chain.doFilter(request, response);
            }
        } else {            

            String userlogin = session.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                isAdmin = u.getIsAdmin();
            }
            if ((url.contains("index.xhtml") || url.contains("registr.xhtml")) && isAdmin == 0) {
                resp.sendRedirect(req.getServletContext().getContextPath() + "/welcome.xhtml");
            } else if (url.contains("logout.xhtml")) {
                req.getSession().removeAttribute("login");
                resp.sendRedirect(req.getServletContext().getContextPath() + "/index.xhtml");
            } else {
                chain.doFilter(request, response);
            }
        }
        
    }

    @Override
    public void destroy() {
    }

}
