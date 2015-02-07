package ua.divas.bean;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Map;
import java.util.UUID;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.context.RequestContext;
import org.primefaces.event.FileUploadEvent;
import ua.divas.model.CallListsFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.CallLists;
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.Kontragents;
import ua.divas.model.entity.Users;

@SessionScoped
@ManagedBean
public class FileUploadView implements Serializable {

    private final String destination = "/home/igor/tmp/";
    @EJB
    private CallListsFacade clf;
    CallLists cl;

    @EJB
    private UsersFacade uf;
    Users usr;

    @EJB
    private KontragentsFacade kf;
    Kontragents kontr;

    @EJB
    private ContactDetailsFacade cdf;
    ContactDetails details;
    
    @ManagedProperty("#{agentsTableBean}")
    private AgentsTableBean agentBean;
    
    public void handleFileUpload(FileUploadEvent event) {

        FacesMessage message = new FacesMessage("Удачно", event.getFile().getFileName() + " файл успешно загружен.");
        FacesContext.getCurrentInstance().addMessage(null, message);
        
        

        try {
            TransferFile(event.getFile().getFileName(), event.getFile().getInputstream());
        } catch (IOException ex) {
            System.out.println("Ошибка " + ex);
        }

        String csvFile = destination + event.getFile().getFileName();
        BufferedReader br = null;
        String line = "";
        String csvSplitBy = ",";

        try {

            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                //запятая как разделитель
                String[] country = line.split(csvSplitBy);
                
                
                details = new ContactDetails();
                kontr = new Kontragents();

                long time = System.currentTimeMillis();
                Date data = new Date(time);

                kontr.setId(UUID.randomUUID().toString());
                kontr.setVersion(new Timestamp(data.getTime()));

                Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
                Login bean = (Login) sessionMap.get("login");

                String userlogin = null;
                if (bean != null) {
                    userlogin = bean.getUsr();
                    for (Users u : uf.findByLogin(userlogin)) {
                        kontr.setUserId(u);
                    }
                }

                kontr.setPredefined((short) 0);
                kontr.setUrFiz((short) 0);
                kontr.setDeleted((short) 0);
                kontr.setIsGroup((short) 0);
                kontr.setIsSupplier((short) 0);
                kontr.setIsMeasurer((short) 0);
                kontr.setIsBuyer((short) 1);
                kontr.setFullname(country[0]);

                for (Kontragents k : kf.findByFullname("Покупатели")) {
                    kontr.setParentId(k);
                }
                kf.create(kontr);
                details.setId(UUID.randomUUID().toString());
                details.setVersion(new Timestamp(data.getTime()));
                details.setPhone(country[1]);
                if(country.length>2){
                    details.setAdress(country[2]);
                }
                if(country.length>3){
                   details.setEmail(country[3]);
                }                
                details.setKontragId(kontr);
                cdf.create(details);

                cl = new CallLists();
                cl.setId(UUID.randomUUID().toString());

                for (Users u : uf.findByLogin(userlogin)) {
                    cl.setUsersId(u.getId());
                }
                 cl.setKontragentsId(kontr);
            cl.setListName(event.getFile().getFileName());
            cl.setVersion(new Timestamp(data.getTime()));
            clf.create(cl);
            }          

        } catch (FileNotFoundException e) {
            System.out.println("Ошибка " + e);
        } catch (IOException e) {
            System.out.println("Ошибка " + e);
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    System.out.println("Ошибка " + e);
                }
            }
        }

        System.out.println("Done");
        
        getAgentBean().findAll();
        getAgentBean().getInfoBean().construct();        
        RequestContext.getCurrentInstance().update("infoForm");
        RequestContext.getCurrentInstance().update("agentsForm");
    }

    public void TransferFile(String fileName, InputStream in) {
        try {
            // write the inputStream to a FileOutputStream
            OutputStream out = new FileOutputStream(new File(destination + fileName));

            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = in.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

            in.close();
            out.flush();
            out.close();

            System.out.println("New file created!");
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    public AgentsTableBean getAgentBean() {
        return agentBean;
    }

    public void setAgentBean(AgentsTableBean agentBean) {
        this.agentBean = agentBean;
    }
}
