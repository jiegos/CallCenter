package ua.divas.bean;

import java.io.Serializable;
import java.util.Map;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import ua.divas.model.CdrFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.Users;

@RequestScoped
@ManagedBean
public class ButtonCall implements Serializable {

    public ButtonCall() {

    }
    @EJB
    private CdrFacade f;
    Cdr cdr = new Cdr();
    private String number;
    @EJB
    private UsersFacade uf;
    @EJB
    private ContactDetailsFacade cdf;
    
    
    @ManagedProperty(value = "#{remainderBean}")
    private RemainderBean remainderBeanChannel;
    
    @ManagedProperty(value = "#{agentsTableBean}")
    private AgentsTableBean agent;
    
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void buttonAction() {
         String UserId = null;
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                UserId= u.getId();
            }
        }
        CallThread ct = new CallThread(number,f,cdf,UserId, remainderBeanChannel.getChannel());
    }
    
    public void bCall(){
        number = getAgent().getSelectedRow().getPhone();
        buttonAction();
    }

    public RemainderBean getRemainderBeanChannel() {
        return remainderBeanChannel;
    }

    public void setRemainderBeanChannel(RemainderBean remainderBeanChannel) {
        this.remainderBeanChannel = remainderBeanChannel;
    }

    public AgentsTableBean getAgent() {
        return agent;
    }

    public void setAgent(AgentsTableBean agent) {
        this.agent = agent;
    }

}
