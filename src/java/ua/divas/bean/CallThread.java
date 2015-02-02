/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.divas.bean;

import java.io.IOException;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import org.asteriskjava.manager.TimeoutException;
import ua.divas.model.CdrFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.ContactDetails;

/**
 *
 * @author igor
 */
@RequestScoped
@ManagedBean
public class CallThread implements Serializable, Runnable {
    
    Thread thrd;
    private String number;
    public CallThread(){
        
    }

    public CallThread(String number, CdrFacade f, ContactDetailsFacade cdf, String UserId, String channel) {
        this.number = number;
        thrd=new Thread(this);
        thrd.start();
        this.f=f;
        this.cdf=cdf;
        this.UserId=UserId;
        this.channel = channel;
    }
    
    
    private CdrFacade f;
    Cdr cdr = new Cdr();
   
    private ContactDetailsFacade cdf;
    private String UserId;
    private String channel;
    
    public void run() {
       
        try {
            AsteriskManager am = new AsteriskManager(number, channel);
            cdr.setAllCallTime(am.getAll_call());
            cdr.setCallAnswerTime(am.getCall_answer());
            cdr.setCallEndTime(am.getCall_end());
            cdr.setCallStartTime(am.getCall_start());
            cdr.setCallStatus(am.getCall_status());
            cdr.setId(am.getId());
            cdr.setUserId(UserId);
            cdr.setPhone(number);
            for(ContactDetails cd : cdf.findAll()){
                if(number.equals(cd.getPhone())){
                    cdr.setKontragentId(cd.getKontragId());
                }
            }            
            System.out.println("Добавление в базу "+cdr);
            f.create(cdr);
            System.out.println("Добавлено");

        } catch (IOException ex) {
            System.out.println("Ошибка" + ex);
        } catch (IllegalArgumentException | TimeoutException ex) {
            System.out.println("Ошибка2 " + ex);
        }   
       
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }
    
}
