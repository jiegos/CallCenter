package ua.divas.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.context.RequestContext;
import ua.divas.model.NotificationFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.Notification;
import ua.divas.model.entity.Users;

@ManagedBean
@SessionScoped
public class NotificationBean implements Serializable {

    public NotificationBean() {
    }

    @EJB
    private UsersFacade uf;

    @EJB
    private NotificationFacade nf;
    Notification not;

    private List<Notification> table;
    private List<Notification> temptable;
    private List<Notification> table2;
    private Notification selectedRow;


    private String trgName;

    public String getUserId() {

        String userId = null;
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        String userlogin = null;
        if (bean != null) {
            userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                userId = u.getId();
            }
        }
        return userId;
    }

    public void findNotificationByUser() {        
        table = nf.findByUserId(getUserId());
        temptable = new ArrayList<>();
        for(Notification n : table){
            temptable.add(n);
        }
        table = temptable;
        RequestContext.getCurrentInstance().update("listNotiForm");
    }
    
    public void delNotification() {
        nf.remove(selectedRow);
        selectedRow = null;
        findNotificationByUser();         
        lookNotification();
        RequestContext.getCurrentInstance().update("notiForm:cb12");
    }

    public void lookNotification() {
       
        table2 = new ArrayList<>();
        System.out.println("");
        System.out.println("Поиск пропущенных уведомлений!");
        findNotificationByUser();
       
        for (Notification n : table) {
            System.out.println(" - " + n);
            System.out.println(n.getClient() + " " + n.getServer());
            System.out.println((n.getClient()==0) + " " + (n.getServer()==1));
            if (n.getClient()==0 && n.getServer()==1) {                
                table2.add(n);
                System.out.println(" + "+n);                
            }
        }
        System.out.println(table2);        
        RequestContext.getCurrentInstance().update("notiForm:cb12");
    }

    public void checkNotification() {
        not = selectedRow;
        not.setClient((short) 1);
        nf.edit(not);
        RequestContext.getCurrentInstance().update("listNotiForm"); 
        lookNotification();
    }

    public void addClientCheck() {
        String text = null;
        for (Notification n : nf.findByTrgName(trgName)) {
            not = n;
            System.out.println(not.getDescription());
            text = not.getDescription();
        }
        not.setClient((short) 1);
        nf.edit(not);

        RequestContext.getCurrentInstance().update("growl3");
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Новое уведомление!", text));

    }

    public List<Notification> getTable() {
        return table;
    }

    public void setTable(List<Notification> table) {
        this.table = table;
    }

    public Notification getSelectedRow() {
        return selectedRow;
    }

    public void setSelectedRow(Notification selectedRow) {
        this.selectedRow = selectedRow;
    }


    public String getTrgName() {
        return trgName;
    }

    public void setTrgName(String trgName) {
        this.trgName = trgName;
    }

    public List<Notification> getTable2() {
        return table2;
    }

    public void setTable2(List<Notification> table2) {
        this.table2 = table2;
    }

    public List<Notification> getTemptable() {
        return temptable;
    }

    public void setTemptable(List<Notification> temptable) {
        this.temptable = temptable;
    }

}
