package ua.divas.bean;

import java.io.Serializable;
import javax.faces.bean.RequestScoped;
import org.primefaces.push.PushContext;
import org.primefaces.push.PushContextFactory;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


@RequestScoped
public class RemainderJob implements Job, Serializable {
    

    
    @Override
    public synchronized void execute(JobExecutionContext jec) throws JobExecutionException {
        
        
//        PushContext pushContext = PushContextFactory.getDefault().getPushContext();        
//        pushContext.push(jec.getTrigger().getDescription(), new FacesMessage("ВНИМАНИЕ!","Новое уведомление!"));
       
        PushContext pushContext = PushContextFactory.getDefault().getPushContext();        
        pushContext.push("/" + jec.getTrigger().getDescription(), jec.getJobDetail().getDescription());
       
        if(UsersBean.findUsers(jec.getTrigger().getDescription())){
             System.out.println(jec.getTrigger().getDescription() +  " онлайн!");
            
        }else{
            System.out.println(jec.getTrigger().getDescription() +  " оффлайн!");
            
        }
       
      
       
//        UsersBean users =(UsersBean)jec.getMergedJobDataMap().get("users");
//        System.out.println(users.showUsers());
        
//        PushContext pushContext = PushContextFactory.getDefault().getPushContext();        
//        pushContext.push("/notify", null);
    }
 
 
}
