package ua.divas.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import org.primefaces.context.RequestContext;
import ua.divas.model.CallListsFacade;
import ua.divas.model.CdrFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.CallLists;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.Kontragents;
import ua.divas.model.entity.Users;

@SessionScoped
@ManagedBean
public class AgentsTableBean implements Serializable {

    public AgentsTableBean() {
    }

    @EJB
    private KontragentsFacade kf;
    Kontragents kontr;

    @EJB
    private ContactDetailsFacade cdf;
    ContactDetails details;
    ContactDetails details2;

    @EJB
    private UsersFacade uf;
    Users usr;

    @EJB
    private CallListsFacade clf;
    CallLists cl;

    @EJB
    private CdrFacade f;

    @ManagedProperty("#{viewListsBean}")
    private ViewListsBean listBean;

    @ManagedProperty("#{notificationBean}")
    private NotificationBean notiBean;

    @ManagedProperty("#{operatorInfoBean}")
    private OperatorInfoBean infoBean;

    private List<ContactDetails> table;
    private List<ContactDetails> table2;
    private List<Cdr> table3;
    private List<Cdr> info;
    private List<ContactDetails> selectedRows;
    private ContactDetails selectedRow;
    private String listname;
    private String fio;
    private String phone;
    private String email;
    private String adress;
    private String selectedPhone;
    private List<String> phones;
    private String userlogin;
    private String lastCalltime;
    private String times;
    private String answered;
    private String noanswer;
    private String busytime;
    private String calltime;    
    private int calls;

//Заполнение таблицы контрагентов 
    @PostConstruct
    public void findAll() {
        System.out.println("-----------Поиск всех контрагентов ------------");
        table = cdf.findAll();
        table2 = new ArrayList<>();
        ArrayList<Kontragents> tmp = new ArrayList<>();
        System.out.println("-----------Поиск контрагентов для текущего оператора------------");
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            userlogin = bean.getUsr();
            for (ContactDetails cd : table) {
                if (cd.getKontragId().getUserId().getLogin().equals(getUserlogin())) {
                    if (!tmp.contains(cd.getKontragId())) {
                        table2.add(cd);
                        tmp.add(cd.getKontragId());
                    }
                }
            }
        }
        table = table2;
        listBean.setTablename("Таблица контрагентов");
        System.out.println("------------Контрагенты найдены-------------");
    }
//Меню - Список клиентов - Кнопка "Показать всех"

    public void showAllAgent() {

        findAll();
        listBean.setRender(false);
        listBean.setRender2(false);
        listBean.setRender3(true);
        listBean.setRender4(false);
        listBean.setRender5(false);

        RequestContext.getCurrentInstance().update("selectListForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().update("checkAgentsForm");
        RequestContext.getCurrentInstance().update("fileForm");
        RequestContext.getCurrentInstance().update("callListsForm");

        listBean.setTablename("Таблица контрагентов");
    }
//Сохранение выбранных номеров(строк) в базе с названием листа  

    public void buttonSaveList(ActionEvent actionEvent) {
        for (ContactDetails n : getSelectedRows()) {
            cl = new CallLists();
            cl.setId(UUID.randomUUID().toString());

            for (Users u : uf.findByLogin(getUserlogin())) {
                cl.setUsersId(u.getId());
            }

            cl.setKontragentsId(n.getKontragId());
            cl.setListName(listname);
            long time = System.currentTimeMillis();
            Date data = new Date(time);
            cl.setVersion(new Timestamp(data.getTime()));
            clf.create(cl);
        }
        listBean.findLists();
        RequestContext.getCurrentInstance().update("callListsForm");

    }

    public void creatNotification() {
        listBean.getRemainderBeanChannel().creatNotificationFor(selectedRow);
    }

    public void openDetails() {
        ContactDetails detail = notiBean.getSelectedRow().getContact();
        System.out.println(detail);
        selectedRow = detail;

        RequestContext.getCurrentInstance().update("viewAgentForm");
        RequestContext.getCurrentInstance().execute("dlg9.show()");
    }

//Добавление нового контрагента в базу
    public void createKontragent(ActionEvent actionEvent) {
        details = new ContactDetails();
        kontr = new Kontragents();

        long time = System.currentTimeMillis();
        Date data = new Date(time);

        kontr.setId(UUID.randomUUID().toString());
        kontr.setVersion(new Timestamp(data.getTime()));

        for (Users u : uf.findByLogin(getUserlogin())) {
            kontr.setUserId(u);
        }

        kontr.setPredefined((short) 0);
        kontr.setUrFiz((short) 0);
        kontr.setDeleted((short) 0);
        kontr.setIsGroup((short) 0);
        kontr.setIsSupplier((short) 0);
        kontr.setIsMeasurer((short) 0);
        kontr.setIsBuyer((short) 1);
        kontr.setFullname(fio);

        for (Kontragents k : kf.findByFullname("Покупатели")) {
            kontr.setParentId(k);
        }
        kf.create(kontr);
        details.setId(UUID.randomUUID().toString());
        details.setVersion(new Timestamp(data.getTime()));
        details.setPhone(phone);
        details.setKontragId(kontr);
        details.setEmail(email);
        details.setAdress(adress);
        cdf.create(details);
        findAll();
        getInfoBean().construct();
        RequestContext.getCurrentInstance().update("infoForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().execute("dlg1.hide()");
    }
//Изменение данных

    public void editKontragent() {
        kontr = kf.findById(selectedRow.getKontragId().getId());
        kontr.setFullname(selectedRow.getKontragId().getFullname());

        for (ContactDetails d : cdf.findByKontragentId(kontr)) {
            d.setAdress(selectedRow.getAdress());
            d.setEmail(selectedRow.getEmail());
            System.out.println(d.getPhone());
            if (d.getPhone().compareTo(selectedPhone) == 0) {
                d.setPhone(selectedRow.getPhone());
            }
            cdf.edit(d);
        }

        kf.edit(kontr);
        System.out.println("Изменения контрагента " + kontr);

        getInfoBean().construct();
        RequestContext.getCurrentInstance().update("infoForm");
        RequestContext.getCurrentInstance().update("agentsForm");
    }

    public void addPhone() {
        kontr = kf.findById(selectedRow.getKontragId().getId());
        if (cdf.findByKontragentId(kontr).size() < 5) {
            kontr.setFullname(selectedRow.getKontragId().getFullname());
            long time = System.currentTimeMillis();
            Date data = new Date(time);
            details = new ContactDetails();
            details.setId(UUID.randomUUID().toString());
            details.setVersion(new Timestamp(data.getTime()));
            details.setPhone(phone);
            details.setKontragId(kontr);
            details.setEmail(selectedRow.getEmail());
            details.setAdress(selectedRow.getAdress());
            cdf.create(details);
            findAll();
            RequestContext.getCurrentInstance().update("agentsForm");
        }
    }
//Измененние данных о клинте

    public void editClient(ActionEvent actionEvent) {
        kontr = kf.findById(selectedRow.getKontragId().getId());
        kontr.setFullname(selectedRow.getKontragId().getFullname());
        System.out.println(selectedRow.getKontragId().getId());
        String phone1 = selectedRow.getPhone();
        String phone2 = selectedPhone;
        if (phone1.compareTo(phone2) != 0) {
            for (ContactDetails d : cdf.findByKontragentId(kontr)) {
                if (d.getPhone().compareTo(phone1) == 0) {
                    details = d;
                    details.setPhone(phone2);
                } else if (d.getPhone().compareTo(phone2) == 0) {
                    details2 = d;
                    details2.setPhone(phone1);
                }
            }
        }
        cdf.edit(details2);
        cdf.edit(details);
        kf.edit(kontr);
        System.out.println("Изменения контрагента " + kontr);
        findAll();
        RequestContext.getCurrentInstance().update("agentsForm");
    }

//Удаление данных о клинте
    public void deleteClient(ActionEvent actionEvent) {
        kontr = kf.findById(selectedRow.getKontragId().getId());
        System.out.println(kontr);
        kf.remove(kontr);
        System.out.println("Удаление контрагента " + kontr);
        selectedRow = null;
        findAll();
        getInfoBean().construct();
        RequestContext.getCurrentInstance().update("infoForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().execute("dlg1.hide()");

    }

    public void agentInfo() {
        findLastTime();
        calltimeInfo();
    }
    public void calltimeInfo(){
        info = f.findByKontragentId(selectedRow.getKontragId());
        calls = f.findByKontragentId(selectedRow.getKontragId()).size();
        Long temp =0L;
        int i = 0;
        int j = 0;
        
        String temp_noanswered=null;
        String temp_answered=null;
        Long busytemp=0L;
        Long calltemp=0L;
        for(Cdr c : getInfo()){
            temp+=c.getAllCallTime();
             if(c.getCallStatus().equals("ANSWERED")){
                temp_answered=""+(++i);
            }else{
                temp_noanswered=""+(++j);
            } 
           java.util.Date time = c.getCallStartTime();
           java.util.Date time2 = c.getCallAnswerTime();
           java.util.Date time3 = c.getCallEndTime();
           busytemp+=(time2.getTime()-time.getTime());
           calltemp+=(time3.getTime()-time2.getTime());
            
           
        }
        setAnswered(temp_answered);
        setNoanswer(temp_noanswered);
        setTimes(formatDate(temp));
        setBusytime(formatDate(busytemp/1000));
        setCalltime(formatDate(calltemp/1000));       
       
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
    
    public void findLastTime(){
        table3 = f.findByKontragentId(selectedRow.getKontragId());

        java.util.Date temp = new Date(0);

        SimpleDateFormat dateFormat = null;

        dateFormat = new SimpleDateFormat("d/MM/yy HH:mm:ss");

        for (Cdr r : table3) {
            if (r.getCallStartTime().after(temp)) {
                temp = r.getCallStartTime();
            }
        }
        if (temp.equals(new Date(0))) {
            lastCalltime = "не было звонков";
        } else {
            lastCalltime = dateFormat.format(temp);
        }
    }
    
    public void searchPhone() {
        phones = cdf.findPhones(selectedRow.getKontragId());
    }

    public List<ContactDetails> getSelectedRows() {
        return selectedRows;

    }

    public void setSelectedRows(List<ContactDetails> selected) {
        this.selectedRows = selected;

        if (selectedRows.isEmpty()) {
            System.out.println("В таблице агентов ничего не выбрано");
            System.out.println("");
        } else {
            System.out.println("------------Выбрано---------- ");
            System.out.println(selectedRows);
            System.out.println("------------------------------");
            System.out.println("");
        }
        if (selectedRows.size() == 1) {
            for (ContactDetails a : selectedRows) {
                selectedRow = a;
            }
        }

    }

    public String getListname() {
        return listname;
    }

    public void setListname(String listname) {
        this.listname = listname;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public ContactDetails getSelectedRow() {
        return selectedRow;
    }

    public void setSelectedRow(ContactDetails selectedRow) {
        this.selectedRow = selectedRow;
    }

    public List<ContactDetails> getTable() {
        return table;
    }

    public void setTable(List<ContactDetails> table) {
        this.table = table;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getSelectedPhone() {
        return selectedPhone;
    }

    public void setSelectedPhone(String selectedPhone) {
        this.selectedPhone = selectedPhone;
    }

    public List<String> getPhones() {
        return phones;
    }

    public void setPhones(List<String> phones) {
        this.phones = phones;
    }

    public ViewListsBean getListBean() {
        return listBean;
    }

    public void setListBean(ViewListsBean listBean) {
        this.listBean = listBean;
    }

    public OperatorInfoBean getInfoBean() {
        return infoBean;
    }

    public void setInfoBean(OperatorInfoBean infoBean) {
        this.infoBean = infoBean;
    }

    public String getUserlogin() {
        return userlogin;
    }

    public void setUserlogin(String userlogin) {
        this.userlogin = userlogin;
    }

    public NotificationBean getNotiBean() {
        return notiBean;
    }

    public void setNotiBean(NotificationBean notiBean) {
        this.notiBean = notiBean;
    }

    public String getLastCalltime() {
        return lastCalltime;
    }

    public void setLastCalltime(String lastCalltime) {
        this.lastCalltime = lastCalltime;
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

    public int getCalls() {
        return calls;
    }

    public void setCalls(int calls) {
        this.calls = calls;
    }

}
