package ua.divas.bean;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import org.asteriskjava.manager.TimeoutException;
import ua.divas.model.CdrFacade;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.ContactDetails;

@RequestScoped
@ManagedBean
public class CallListThread implements Serializable, Runnable {

    Thread thrd;

    public CallListThread() {

    }

    public CallListThread(CdrFacade f, String UserId, ArrayList<String> list, ArrayList<ContactDetails> selectedLists3, String channel) {
        this.callcheck = true;
        thrd = new Thread(this);
        thrd.start();
        this.f = f;
        this.UserId = UserId;
        this.list = list;
        this.selectedLists3 = selectedLists3;
        this.list2 = new ArrayList();
        this.selectedLists4 = new ArrayList();
        this.pollstop = false;
        this.error = false;
        this.channel = channel;
    }

    Cdr cdr = new Cdr();
    private CdrFacade f;
    private ArrayList<String> list;
    private ArrayList<String> list2;
    private String UserId;
    private ArrayList<ContactDetails> selectedLists3;
    private ArrayList<ContactDetails> selectedLists4;
    private Boolean callcheck;
    private Boolean pollstop;
    private Boolean error;
    private String channel;

    public void run() {       
               
        
        for (String s : list) {
            list2.add(s);
        }
        for (ContactDetails cd : selectedLists3) {
            selectedLists4.add(cd);
        }

        for (String n : list) {
            pollstop = false;
            int i = 0;
            if (callcheck) {
                list2.remove(n);
                selectedLists4.remove(selectedLists3.get(i));
                try {
                    AsteriskManager am = new AsteriskManager(n, getChannel());                  
                    if (am.getStatus() != null) {
                        if (am.getStatus().equals("Success")) {
                                cdr.setAllCallTime(am.getAll_call());
                                cdr.setCallAnswerTime(am.getCall_answer());
                                cdr.setCallEndTime(am.getCall_end());
                                cdr.setCallStartTime(am.getCall_start());
                                cdr.setCallStatus(am.getCall_status());
                                cdr.setId(am.getId());
                                cdr.setPhone(n);
                                cdr.setKontragentId(selectedLists3.get(i++).getKontragId());

                                cdr.setUserId(UserId);
                                System.out.println("Добавление в базу " + cdr);
                                f.add(cdr);
                                System.out.println("Добавлено");
                                pollstop = true;
                                try {
                                    Thread.sleep(10000);
                                } catch (InterruptedException exx) {
                                    System.out.println("Ошибка " + exx);
                                }

                        } else {
                            pollstop = true;
                            error = true;
                            break;
                        }
                    } else {
                        pollstop = true;
                    }

                } catch (IOException | IllegalArgumentException | TimeoutException ex) {
                    System.out.println("Ошибка " + ex);
                    pollstop = true;
                }
            }
        }

    }

    public Boolean getCallcheck() {
        return callcheck;
    }

    public void setCallcheck(Boolean callcheck) {
        this.callcheck = callcheck;
    }

    public ArrayList<String> getList2() {
        return list2;
    }

    public void setList2(ArrayList<String> list2) {
        this.list2 = list2;
    }

    public ArrayList<ContactDetails> getSelectedLists4() {
        return selectedLists4;
    }

    public void setSelectedLists4(ArrayList<ContactDetails> selectedLists4) {
        this.selectedLists4 = selectedLists4;
    }

    public Boolean getPollstop() {
        return pollstop;
    }

    public void setPollstop(Boolean pollstop) {
        this.pollstop = pollstop;
    }

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

}
