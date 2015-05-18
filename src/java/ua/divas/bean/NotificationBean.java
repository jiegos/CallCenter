package ua.divas.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.context.RequestContext;
import ua.divas.model.CallLogFacade;
import ua.divas.model.CallResultsFacade;
import ua.divas.model.CallStatusFacade;
import ua.divas.model.Cdr3cxFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.NotificationFacade;
import ua.divas.model.OperatoresPhonesFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.CallLog;
import ua.divas.model.entity.CallResults;
import ua.divas.model.entity.CallStatus;
import ua.divas.model.entity.Cdr3cx;
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.Kontragents;
import ua.divas.model.entity.Notification;
import ua.divas.model.entity.OperatoresPhones;
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

    @EJB
    OperatoresPhonesFacade opf;
    @EJB
    Cdr3cxFacade cdrf;
    @EJB
    KontragentsFacade kf;
    @EJB
    ContactDetailsFacade cdf;

    @EJB
    CallLogFacade logf;
    CallLog log = new CallLog();

    @EJB
    CallResultsFacade resf;
    CallResults result = new CallResults();

    @EJB
    CallStatusFacade csf;
    CallStatus status = new CallStatus();

    private List<Notification> table;
    private List<Notification> temptable;
    private List<Notification> table2;
    private Notification selectedRow;
    private OperatoresPhones table3;
    private Cdr3cx table4;
    private Kontragents kontr;
    private ContactDetails detail;
    private Date time;
    private String time_call;
    private String duration;
    private String statuscall;
    private String comment;

    private String trgName;
    private String cdrId;

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

    public void openDialog() {
        System.out.println(cdrId);
        for (OperatoresPhones op : opf.findAll()) {
            if (cdrId.equals(op.getId())) {
                table3 = op;

            }
        }
        for (Cdr3cx cdr : cdrf.findAll()) {
            if (cdrId.equals(cdr.getId())) {
                table4 = cdr;
                time = cdr.getCallStartTime();
                Calendar cal = Calendar.getInstance();
                cal.setTime(time);
                cal.add(Calendar.HOUR, 3);
                time = cal.getTime();
                Date currentDate = time;
                SimpleDateFormat dateFormat = null;
                dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
                time_call = dateFormat.format(currentDate);

                duration = formatDate(cdr.getDuration());
            }
        }
//Проверка есть ли такой контрагент в базе     
        
        if (table4.getKontragentId()==null) {
            System.out.println("Нет такого контрагента!");            
            RequestContext.getCurrentInstance().execute("dlg11.show()");
        } else {
            for (Kontragents k : kf.findAll()) {
                if (table4.getKontragentId().equals(k.getId())) {
                    kontr = k;
                }

            }
            for (ContactDetails cd : cdf.findAll()) {
                if (table4.getPhone().equals(cd.getPhone())) {
                    detail = cd;
                }
            }
            RequestContext.getCurrentInstance().update("viewCallForm3CX");
            RequestContext.getCurrentInstance().execute("dlg10.show()");
        }
        
    }

    public void callLog3cx() {

        for (CallStatus s : csf.findAll()) {

            if (table4.getCallStatus().equals("Completed") && s.getName().equals("ANSWERED")) {
                log.setCallStatus(s);
            }
            if (table4.getCallStatus().equals("NotAnswered") && s.getName().equals("NO ANSWER")) {
                log.setCallStatus(s);
            }

        }
        for (CallResults r : resf.findAll()) {
            if (r.getFullname().compareTo(statuscall) == 0) {
                log.setCallResults(r);
            }
        }
        log.setCompDetId(null);
        log.setContactId(detail);
        log.setDat(new Date());
        log.setMemo(comment);
        log.setId(UUID.randomUUID().toString());
        long time2 = System.currentTimeMillis();
        java.sql.Date data = new java.sql.Date(time2);
        log.setVersion(new Timestamp(data.getTime()));
        logf.create(log);
        System.out.println("Доблавление в базу " + log);
        RequestContext.getCurrentInstance().execute("dlg10.hide()");

    }

    public String formatDate(Long time) {
        long sec;
        long min;
        long hour;

        hour = time / 3600;
        min = (time - hour * 3600) / 60;
        sec = time - hour * 3600 - min * 60;
        if (hour < 10 && min < 10 && sec < 10) {
            return "0" + hour + ":0" + min + ":0" + sec;
        } else if (hour < 10 && min < 10) {
            return "0" + hour + ":0" + min + ":" + sec;
        } else if (hour < 10 && sec < 10) {
            return "0" + hour + ":" + min + ":0" + sec;
        } else if (min < 10 && sec < 10) {
            return "" + hour + ":0" + min + ":0" + sec;
        } else if (sec < 10) {
            return "" + hour + ":" + min + ":0" + sec;
        } else {
            return hour + ":" + min + ":" + sec;
        }
    }

    public void findNotificationByUser() {
        table = nf.findByUserId(getUserId());

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

        for (Notification n : nf.findByUserId(getUserId())) {
            if (n.getClient() == 0 && n.getServer() == 1) {
                table2.add(n);
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
//        String id = selectedRow.getId();             
//        selectedRow.setClient(nf.findClientById(id));        
//        selectedRow.setServer(nf.findServerById(id));
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

    public String getCdrId() {
        return cdrId;
    }

    public void setCdrId(String cdrId) {
        this.cdrId = cdrId;
    }

    public OperatoresPhones getTable3() {
        return table3;
    }

    public void setTable3(OperatoresPhones table3) {
        this.table3 = table3;
    }

    public Cdr3cx getTable4() {
        return table4;
    }

    public void setTable4(Cdr3cx table4) {
        this.table4 = table4;
    }

    public Kontragents getKontr() {
        return kontr;
    }

    public void setKontr(Kontragents kontr) {
        this.kontr = kontr;
    }

    public ContactDetails getDetail() {
        return detail;
    }

    public void setDetail(ContactDetails detail) {
        this.detail = detail;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTime_call() {
        return time_call;
    }

    public void setTime_call(String time_call) {
        this.time_call = time_call;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getStatuscall() {
        return statuscall;
    }

    public void setStatuscall(String statuscall) {
        this.statuscall = statuscall;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
