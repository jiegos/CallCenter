package ua.divas.bean;

import java.io.IOException;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import ua.divas.model.Cdr3cxFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.OperatoresPhonesFacade;
import ua.divas.model.entity.Cdr3cx;

@ManagedBean
public class StartSocketThread  extends GenericServlet  {
        
    @EJB Cdr3cxFacade f;
    private SocketServer s;
    Cdr3cx cdr = new Cdr3cx();
    @EJB private OperatoresPhonesFacade opf;
    @EJB private KontragentsFacade kf;
    @EJB private ContactDetailsFacade cdf;
   
    
    public void init(ServletConfig config) throws ServletException {
        super.init(config);       
              
        s = new SocketServer(f, cdr, opf, kf, cdf);
        System.out.println("Cdr поток стратовал");
      

    }
   
     
    @Override
    public void service(
            ServletRequest arg0,
            ServletResponse arg1
    ) throws ServletException, IOException {

    }

  



}
