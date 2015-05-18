package ua.divas.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.UUID;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.validation.constraints.Future;
import javax.validation.constraints.Size;
import org.primefaces.context.RequestContext;
import static org.quartz.JobBuilder.newJob;
import org.quartz.JobDetail;
import org.quartz.Trigger;
import static org.quartz.TriggerBuilder.newTrigger;
import ua.divas.model.NotificationFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.Notification;
import ua.divas.model.entity.Users;

@ManagedBean
@SessionScoped
public class RemainderBean implements Serializable {

    public RemainderBean() {
    }
    @Future
    private Date date1;
    @Size(min=5, max=200)
    private String description;
    private String channel;
    private String cutid;
    private String userlogin;
    private String userId;
    private ContactDetails contact = null;
    
    @ManagedProperty(value = "#{usersBean}")
    private UsersBean userbean;
    
    @ManagedProperty("#{notificationBean}")
    private NotificationBean notiBean;  
       
    @EJB
    private UsersFacade uf;
    
    @EJB
    private NotificationFacade nf;
    Notification not;
    
     
    @PostConstruct
    public void doPostConstruction() {
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");        
        if (bean != null) {
            userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
               userId = u.getId();
            }
        }        
        channel ="/" + userlogin;
        System.out.println("Канал для Push - " + channel);       
    }
    
    public void creatNotification(String cutid){
        not = new Notification();
        not.setDat(date1);
        not.setDescription(description);
        String id = UUID.randomUUID().toString();
        not.setId(id);
        not.setUserId(userId);
        not.setUserLogin(userlogin);
        not.setContact(contact);
        not.setTrgName("trigger"+cutid);
        not.setServer((short)0);
        not.setClient((short)0);
        long time = System.currentTimeMillis();
        java.sql.Date data = new java.sql.Date(time);
        not.setVersion(new Timestamp(data.getTime()));
        nf.create(not);
        
        FacesMessage message = new FacesMessage("Напоминание добавлено!");
        FacesContext.getCurrentInstance().addMessage(null, message);
        notiBean.findNotificationByUser();                      
        RequestContext.getCurrentInstance().update("listNotiForm");
        contact=null;
    }
    
    public void creatNotificationFor(ContactDetails detail){
        System.out.println("");
        contact = detail;
        System.out.println(contact);
    }
    
    public void creatOnlyNotification(){
        contact = null;        
        System.out.println(contact);
    }
    
    public void run() throws Exception {
        
        cutid = UUID.randomUUID().toString().substring(0, 7);      
    
        JobDetail job = newJob(RemainderJob.class).withDescription("trigger"+cutid).withIdentity("job"+cutid, "group").build();
        
//        job.getJobDataMap().put("users", userbean);
        
        Date runDate = date1;

        Trigger trigger = newTrigger().startAt(runDate).withDescription(userlogin).withIdentity("trigger"+cutid, "group").build();
  
        System.out.println("------- Новое напоминание! ----------------");
       
        StartSchedulerQuartz.sched.scheduleJob(job, trigger);
        RequestContext.getCurrentInstance().execute("dlg8.hide()");
        creatNotification(cutid);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public UsersBean getUserbean() {
        return userbean;
    }

    public void setUserbean(UsersBean userbean) {
        this.userbean = userbean;
    }

    public NotificationBean getNotiBean() {
        return notiBean;
    }

    public void setNotiBean(NotificationBean notiBean) {
        this.notiBean = notiBean;
    }

    public ContactDetails getContact() {
        return contact;
    }

    public void setContact(ContactDetails contact) {
        this.contact = contact;
    }


}
