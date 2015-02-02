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
import static org.quartz.JobBuilder.newJob;
import static org.quartz.JobBuilder.newJob;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Trigger;
import static org.quartz.TriggerBuilder.newTrigger;
import ua.divas.model.CallListsFacade;
import ua.divas.model.NotificationFacade;
import ua.divas.model.UsersFacade;
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
    
    @ManagedProperty(value = "#{usersBean}")
    private UsersBean userbean;
    
    @EJB
    private UsersFacade uf;
    
    @EJB
    private NotificationFacade nf;
    Notification not = new Notification();
    
    
    @EJB
    private CallListsFacade clf;
     
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
        System.out.println(channel);
       // channel = "/" + UUID.randomUUID().toString();        
        //channels.addChannel(userlogin, channel);  
       
    }
    
    public void creatNotification(){
        not.setDat(date1);
        not.setDescription(description);
        String id = UUID.randomUUID().toString();
        not.setId(id);
        not.setUserId(userId);
        long time = System.currentTimeMillis();
        java.sql.Date data = new java.sql.Date(time);
        not.setVersion(new Timestamp(data.getTime()));
        nf.create(not);
        FacesMessage message = new FacesMessage("Напоминание добавлено!");
        FacesContext.getCurrentInstance().addMessage(null, message);
    }
    public void clearDescription(){
        description = null;
        date1=null;
        RequestContext.getCurrentInstance().update("f11");        
        RequestContext.getCurrentInstance().execute("dlg8.show()");
    }
    
    public void run() throws Exception {
        
        creatNotification();
        RequestContext.getCurrentInstance().execute("p9.start()");
        
        cutid = UUID.randomUUID().toString().substring(0, 7);      
    
        JobDetail job = newJob(RemainderJob.class).withIdentity("job"+cutid, "group").build();
        
//        job.getJobDataMap().put("users", userbean);
        
        Date runDate = date1;

        Trigger trigger = newTrigger().startAt(runDate).withDescription("/"+userlogin).withIdentity("trigger"+cutid, "group").build();
  
        System.out.println("------- Новое напоминание! ----------------");
       
        StartSchedulerQuartz.sched.scheduleJob(job, trigger);
        RequestContext.getCurrentInstance().execute("dlg8.hide()");
        
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


}
