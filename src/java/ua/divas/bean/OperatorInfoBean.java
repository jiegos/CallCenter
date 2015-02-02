package ua.divas.bean;


import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import ua.divas.model.CdrFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.Users;

@SessionScoped
@ManagedBean
public class OperatorInfoBean implements Serializable {
    

    public OperatorInfoBean() {
    }
    @EJB
    private KontragentsFacade kf;
    @EJB
    private UsersFacade uf;
    @EJB
    private CdrFacade f;
    Cdr cdr = new Cdr();
    @ManagedProperty("#{agentsTableBean}")
    private AgentsTableBean agents;
    private int calls;
    private List<Cdr> info;
    private String times;
    private String answered;
    private String noanswer;
    private String busytime;
    private String calltime;
    private List<Cdr> list;
    private int count=0;
    private int count2=0;

    public void callInfo(){
        String UserId = null;
        int tempcount = 0;
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                UserId= u.getId();               
        
               tempcount=kf.findByUserId(u).size();
            }
        }
        calls=f.findByUserId(UserId).size();
        count=tempcount;
        
    }
    public void agentInfo(){
        String UserId = null;
        int tempcount2 = 0;
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                UserId= u.getId();
            }
        }
        list=f.findByUserId(UserId);
        for(Cdr k: list){
            if(k.getKontragentId().equals(agents.getSelectedRow().getKontragId())){
                tempcount2++;
            }
        }
        count2=tempcount2;
    }
    public void calltimeInfo(){
        String UserId = null;
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                UserId= u.getId();
            }
        }
        info=f.findByUserId(UserId);
        Long temp =0L;
        int i = 0;
        int j = 0;
        
        String temp_noanswered=null;
        String temp_answered=null;
        Long busytemp=0L;
        Long calltemp=0L;
        for(Cdr c : info){
            temp+=c.getAllCallTime();
             if(c.getCallStatus().equals("ANSWERED")){
                temp_answered=""+(++i);
            }else{
                temp_noanswered=""+(++j);
            } 
           Date time = c.getCallStartTime();
           Date time2 = c.getCallAnswerTime();
           Date time3 = c.getCallEndTime();
           busytemp+=(time2.getTime()-time.getTime());
           calltemp+=(time3.getTime()-time2.getTime());
            
           
        }
        answered=temp_answered;
        noanswer=temp_noanswered;
        times=formatDate(temp);
        busytime=formatDate(busytemp/1000);
        calltime=formatDate(calltemp/1000);
        
       
    }
    
    public String formatDate(Long time){
        long sec;
        long min;
        long hour;
        
        hour=time/3600;
        min=(time-hour*3600)/60;
        sec=time-hour*3600-min*60;
        if(hour<10 && min<10 && sec<10){
            return "0"+hour+":0"+min+":0"+sec;
        }else if (hour<10 && min<10){
            return "0"+hour+":0"+min+":"+sec;
        }else if (hour<10 && sec<10){
            return "0"+hour+":"+min+":0"+sec    ;
        }else if (min<10 && sec<10){
            return ""+hour+":0"+min+":0"+sec;
        }else if (sec<10){
            return ""+hour+":"+min+":0"+sec;
        }else{
        return hour+":"+min+":"+sec;
        }
    }
    
    public int getCalls() {
        return calls;
    }

    public void setCalls(int calls) {
        this.calls = calls;
    }

    public List<Cdr> getInfo() {
        return info;
    }

    public void setInfo(List<Cdr> info) {
        this.info = info;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public String getAnswered() {
        return answered;
    }

    public void setAnswered(String answered) {
        this.answered = answered;
    }

    public String getNoanswer() {
        return noanswer;
    }

    public void setNoanswer(String noanswer) {
        this.noanswer = noanswer;
    }

    public String getBusytime() {
        return busytime;
    }

    public void setBusytime(String busytime) {
        this.busytime = busytime;
    }

    public String getCalltime() {
        return calltime;
    }

    public void setCalltime(String calltime) {
        this.calltime = calltime;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCount2() {
        return count2;
    }

    public void setCount2(int count2) {
        this.count2 = count2;
    }

    public void setAgents(AgentsTableBean agents) {
        this.agents = agents;
    }
}
