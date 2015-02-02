package ua.divas.bean;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
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
    Notification not = new Notification();

    private List<Notification> table;
    private Notification selectedRow;

    @ManagedProperty("#{styleBean}")
    private StyleBean style;

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
        style.setColor("black");
    } 
    
    public void delNotification() {
        nf.remove(selectedRow);
        selectedRow = null;
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

    public StyleBean getStyle() {
        return style;
    }

    public void setStyle(StyleBean style) {
        this.style = style;
    }
}
