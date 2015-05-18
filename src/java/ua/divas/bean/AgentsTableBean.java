package ua.divas.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import org.primefaces.context.RequestContext;
import org.primefaces.event.SelectEvent;
import ua.divas.model.CallListsFacade;
import ua.divas.model.CallLogFacade;
import ua.divas.model.CallResultsFacade;
import ua.divas.model.Cdr3cxFacade;
import ua.divas.model.CdrFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.CallLists;
import ua.divas.model.entity.CallLog;
import ua.divas.model.entity.CallResults;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.Cdr3cx;
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
    private CallLogFacade logf;
    CallLog cl3cx;

    @EJB
    private CdrFacade f;

    @EJB
    private Cdr3cxFacade fx;

    @EJB
    private CallResultsFacade crf;

    @ManagedProperty("#{viewListsBean}")
    private ViewListsBean listBean;

    @ManagedProperty("#{notificationBean}")
    private NotificationBean notiBean;

    @ManagedProperty("#{operatorInfoBean}")
    private OperatorInfoBean infoBean;

    private List<ContactDetails> table;
    private List<ContactDetails> table2;
    private List<ContactDetails> table4;
    private List<Cdr> table3;
    private List<Cdr3cx> table3cx;
    private List<Cdr> info;
    private List<Cdr3cx> info3cx;
    private List<CallLog> selectedRows;
    private List<CallLog> tableLog;
    private List<CallLog> tableLog2;
    private CallLog selectedRow;
    private String listname;
    private String fio;
    private String phone;
    private String email;
    private String adress;
    private String selectedPhone;
    private List<String> phones;
    private String userlogin;
    private String lastCalltime;
    private String lastCalltime3cx;
    private String times;
    private String answered;
    private String noanswer;
    private String busytime;
    private String calltime;
    private int calls;
    private List<String> logId;
    private List<String> logId2;
    private List<Object> listfinal;
    private SelectEvent lastevent;
    private String statusCall;
    private List<String> status;
    private String[] selectedStatus;
    private java.util.Date date1;
    private java.util.Date date2;
    private String date;

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
        tableLog = new ArrayList<>(); //Таблица с последними звонками ContactDetail
        logId = new ArrayList<>();

//Поиск истории звонков с контактом (последний звонок)
        for (ContactDetails cd2 : table2) {
            java.util.Date temp = new Date(0);

            for (CallLog cl2 : logf.findByContact_Id(cd2)) {
                if (cl2.getDat().after(temp)) {
                    temp = cl2.getDat();
                    logId.clear();
                    logId.add(cl2.getId());

                }
            }
            for (String s : logId) {
                if (!tableLog.contains(logf.find(s))) {
                    tableLog.add(logf.find(s));

                }
            }

        }

        table4 = new ArrayList<>();
        for (CallLog l : tableLog) {
            table4.add(l.getContactId());
        }

//Временное добавление в таблицу callLog контактов у которых не было еще звонков 
        for (ContactDetails d : table2) {
            if (!table4.contains(d)) {
                cl3cx = new CallLog();
                cl3cx.setId(UUID.randomUUID().toString());
                cl3cx.setMemo("Не было звонков");
                cl3cx.setContactId(d);
                tableLog.add(cl3cx);
            }
        }

        listBean.setTablename("Таблица контрагентов");
        System.out.println("------------Контрагенты найдены-------------");
        addStatus();

    }

    public void addStatus() {

        status = new ArrayList<>();
        for (CallResults r : crf.findAll()) {
            status.add(r.getFullname());
        }

    }

//Добавление в таблицу листов информации про звонки и комментарии
    public void onRowSelect(SelectEvent event) {
        listBean.onRowSelect(event);
        lastevent = event;
        tableLog2 = new ArrayList<>();
        logId2 = new ArrayList<>();
        for (CallLog l : tableLog) {
            for (ContactDetails cd2 : listBean.getSelectedLists1()) {
                if (l.getContactId().equals(cd2)) {
                    tableLog2.add(l);
                }
            }
        }
        System.out.println(tableLog2);
    }

//Открыть диалог
    public void openDialog() {
        notiBean.openDialog();
        getInfoBean().construct();
        RequestContext.getCurrentInstance().update("infoForm");
    }

    public void callLog3cx() {
        notiBean.callLog3cx();
        RequestContext.getCurrentInstance().update("agentsForm");
        findAll();
        onRowSelect(lastevent);
        RequestContext.getCurrentInstance().update("selectListForm");
        getInfoBean().construct();
        RequestContext.getCurrentInstance().update("infoForm");

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
        for (CallLog n : getSelectedRows()) {
            cl = new CallLists();
            cl.setId(UUID.randomUUID().toString());

            for (Users u : uf.findByLogin(getUserlogin())) {
                cl.setUsersId(u.getId());
            }

            cl.setKontragentsId(n.getContactId().getKontragId());
            cl.setListName(listname);
            long time = System.currentTimeMillis();
            Date data = new Date(time);
            cl.setVersion(new Timestamp(data.getTime()));
            clf.create(cl);
        }
        listBean.findLists();
        RequestContext.getCurrentInstance().update("callListsForm");

    }

    //Сохранение выбранных номеров(строк) в базе с названием листа (с параметрами) 
    public void saveList2() {

        System.out.println(Arrays.toString(selectedStatus));

        List<CallLog> listLog = new ArrayList<>();

        Date afterDate = new java.sql.Date(date1.getTime());
        Date beforeDate = new java.sql.Date(date2.getTime());

        for (CallLog n : tableLog) {
            for (String s : selectedStatus) {
                if (n.getCallResults() != null) {
                    if (n.getCallResults().getFullname().equals(s)) {
                        if (n.getDat() != null) {
                            if (n.getDat().after(afterDate) && n.getDat().before(beforeDate)) {
                                listLog.add(n);
                            }
                        }
                    }
                }
            }
        }

        for (CallLog n : listLog) {
            cl = new CallLists();
            cl.setId(UUID.randomUUID().toString());

            for (Users u : uf.findByLogin(getUserlogin())) {
                cl.setUsersId(u.getId());
            }

            cl.setKontragentsId(n.getContactId().getKontragId());
            cl.setListName(listname);
            long time = System.currentTimeMillis();
            Date data = new Date(time);
            cl.setVersion(new Timestamp(data.getTime()));
            clf.create(cl);
        }
        listBean.findLists();
        RequestContext.getCurrentInstance().update("callListsForm2");

    }

    public void creatNotification() {
        listBean.getRemainderBeanChannel().creatNotificationFor(selectedRow.getContactId());
    }

    public void openDetails() {
        ContactDetails detail = notiBean.getSelectedRow().getContact();
        System.out.println(detail);
        for (CallLog l : logf.findByContact_Id(detail)) {
            selectedRow = l;
        }

        RequestContext.getCurrentInstance().update("viewAgentForm");
        RequestContext.getCurrentInstance().execute("dlg9.show()");
    }

    public void openDetail2() {
        ContactDetails detail = notiBean.getDetail();
        System.out.println(detail);
        for (CallLog l : logf.findByContact_Id(detail)) {
            selectedRow = l;
        }
        RequestContext.getCurrentInstance().update("viewAgentForm");
        RequestContext.getCurrentInstance().execute("dlg9.show()");
    }
//
//    public void test(){
//        System.out.println("проверка");
//         PushContext pushContext = PushContextFactory.getDefault().getPushContext();        
//         pushContext.push("/notify", null);
//              
//    }
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

    //Добавление нового контрагента в базу
    public void createKontragent2(ActionEvent actionEvent) {
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
        phone = notiBean.getTable4().getPhone();
        details.setPhone(phone);
        details.setKontragId(kontr);
        details.setEmail(email);
        details.setAdress(adress);
        cdf.create(details);
        findAll();
        getInfoBean().construct();
        RequestContext.getCurrentInstance().update("infoForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().execute("dlg11.hide()");

        for (Cdr3cx cdr : fx.findAll()) {
            if (notiBean.getCdrId().equals(cdr.getId())) {
                cdr.setKontragentId(kontr.getId());
                fx.edit(cdr);
            }
        }
        notiBean.openDialog();

    }
//Изменение данных

    public void editKontragent() {
        kontr = kf.findById(selectedRow.getContactId().getKontragId().getId());
        kontr.setFullname(selectedRow.getContactId().getKontragId().getFullname());

        for (ContactDetails d : cdf.findByKontragentId(kontr)) {
            d.setAdress(selectedRow.getContactId().getAdress());
            d.setEmail(selectedRow.getContactId().getEmail());
            System.out.println(d.getPhone());
            if (d.getPhone().compareTo(selectedPhone) == 0) {
                d.setPhone(selectedRow.getContactId().getPhone());
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
        kontr = kf.findById(selectedRow.getContactId().getKontragId().getId());
        if (cdf.findByKontragentId(kontr).size() < 5) {
            kontr.setFullname(selectedRow.getContactId().getKontragId().getFullname());
            long time = System.currentTimeMillis();
            Date data = new Date(time);
            details = new ContactDetails();
            details.setId(UUID.randomUUID().toString());
            details.setVersion(new Timestamp(data.getTime()));
            details.setPhone(phone);
            details.setKontragId(kontr);
            details.setEmail(selectedRow.getContactId().getEmail());
            details.setAdress(selectedRow.getContactId().getAdress());
            cdf.create(details);
            findAll();
            RequestContext.getCurrentInstance().update("agentsForm");
        }
    }
//Измененние данных о клинте

    public void editClient(ActionEvent actionEvent) {
        kontr = kf.findById(selectedRow.getContactId().getKontragId().getId());
        kontr.setFullname(selectedRow.getContactId().getKontragId().getFullname());
        System.out.println(selectedRow.getContactId().getKontragId().getId());
        String phone1 = selectedRow.getContactId().getPhone();
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
        kontr = kf.findById(selectedRow.getContactId().getKontragId().getId());
        for (Cdr3cx c : fx.findAll()) {
            if (c.getKontragentId() != null) {
                if (c.getKontragentId().equals(kontr.getId())) {
                    c.setKontragentId(null);
                    fx.edit(c);
                }
            }

        }
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
//        findLastTime();
//        calltimeInfo();
        findLastTime3cx();
        calltimeInfo3cx();

    }

    public void calltimeInfo() {
        info = f.findByKontragentId(selectedRow.getContactId().getKontragId());
        calls = f.findByKontragentId(selectedRow.getContactId().getKontragId()).size();
        Long temp = 0L;
        int i = 0;
        int j = 0;

        String temp_noanswered = null;
        String temp_answered = null;
        Long busytemp = 0L;
        Long calltemp = 0L;
        for (Cdr c : getInfo()) {
            temp += c.getAllCallTime();
            if (c.getCallStatus().equals("ANSWERED")) {
                temp_answered = "" + (++i);
            } else {
                temp_noanswered = "" + (++j);
            }
            java.util.Date time = c.getCallStartTime();
            java.util.Date time2 = c.getCallAnswerTime();
            java.util.Date time3 = c.getCallEndTime();
            busytemp += (time2.getTime() - time.getTime());
            calltemp += (time3.getTime() - time2.getTime());

        }
        setAnswered(temp_answered);
        setNoanswer(temp_noanswered);
        setTimes(formatDate(temp));
        setBusytime(formatDate(busytemp / 1000));
        setCalltime(formatDate(calltemp / 1000));

    }

    public void calltimeInfo3cx() {
        String UserId = null;
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");

        if (bean != null) {
            userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                UserId = u.getId();
            }
        }
        info3cx = fx.findByKontragentId(selectedRow.getContactId().getKontragId().getId());
        calls = fx.findByKontragentId(selectedRow.getContactId().getKontragId().getId()).size();
        Long temp = 0L;
        int i = 0;
        int j = 0;

        String temp_noanswered = null;
        String temp_answered = null;
        for (Cdr3cx c : info3cx) {
            temp += c.getDuration();
            if (c.getCallStatus().equals("Completed")) {
                temp_answered = "" + (++i);
            } else {
                temp_noanswered = "" + (++j);
            }
        }
        answered = temp_answered;
        noanswer = temp_noanswered;
        times = formatDate(temp);
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

    public void findLastTime() {
        table3 = f.findByKontragentId(selectedRow.getContactId().getKontragId());

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

    public void findLastTime3cx() {

        java.util.Date temp = new Date(0);

        SimpleDateFormat dateFormat = null;

        dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yy");

        for (CallLog l : logf.findByContact_Id(selectedRow.getContactId())) {
            if (l.getDat().after(temp)) {
                temp = l.getDat();
                statusCall = l.getCallResults().getFullname();
            }
        }
        if (temp.equals(new Date(0))) {
            lastCalltime3cx = "не было звонков";
            statusCall = null;
        } else {
            lastCalltime3cx = dateFormat.format(temp);
        }
    }

    public void searchPhone() {
        phones = cdf.findPhones(selectedRow.getContactId().getKontragId());
    }

    public List<CallLog> getSelectedRows() {
        return selectedRows;

    }

    public void setSelectedRows(List<CallLog> selected) {
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
            for (CallLog a : selectedRows) {
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

    public CallLog getSelectedRow() {
        return selectedRow;
    }

    public void setSelectedRow(CallLog selectedRow) {
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

    public List<Cdr3cx> getTable33cx() {
        return table3cx;
    }

    public void setTable33cx(List<Cdr3cx> table33cx) {
        this.table3cx = table33cx;
    }

    public String getLastCalltime3cx() {
        return lastCalltime3cx;
    }

    public void setLastCalltime3cx(String lastCalltime3cx) {
        this.lastCalltime3cx = lastCalltime3cx;
    }

    public List<CallLog> getTableLog() {
        return tableLog;
    }

    public void setTableLog(List<CallLog> tableLog) {
        this.tableLog = tableLog;
    }

    public List<String> getLogId() {
        return logId;
    }

    public void setLogId(List<String> logId) {
        this.logId = logId;
    }

    public List<Object> getListfinal() {
        return listfinal;
    }

    public void setListfinal(List<Object> listfinal) {
        this.listfinal = listfinal;
    }

    public List<ContactDetails> getTable4() {
        return table4;
    }

    public void setTable4(List<ContactDetails> table4) {
        this.table4 = table4;
    }

    public List<CallLog> getTableLog2() {
        return tableLog2;
    }

    public void setTableLog2(List<CallLog> tableLog2) {
        this.tableLog2 = tableLog2;
    }

    public List<String> getLogId2() {
        return logId2;
    }

    public void setLogId2(List<String> logId2) {
        this.logId2 = logId2;
    }

    public SelectEvent getLastevent() {
        return lastevent;
    }

    public void setLastevent(SelectEvent lastevent) {
        this.lastevent = lastevent;
    }

    public String getStatusCall() {
        return statusCall;
    }

    public void setStatusCall(String statusCall) {
        this.statusCall = statusCall;
    }

    public List<Cdr3cx> getInfo3cx() {
        return info3cx;
    }

    public void setInfo3cx(List<Cdr3cx> info3cx) {
        this.info3cx = info3cx;
    }

    public List<String> getStatus() {
        return status;
    }

    public void setStatus(List<String> status) {
        this.status = status;
    }

    public java.util.Date getDate1() {
        return date1;
    }

    public void setDate1(java.util.Date date1) {
        this.date1 = date1;
    }

    public java.util.Date getDate2() {
        return date2;
    }

    public void setDate2(java.util.Date date2) {
        this.date2 = date2;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String[] getSelectedStatus() {
        return selectedStatus;
    }

    public void setSelectedStatus(String[] selectedStatus) {
        this.selectedStatus = selectedStatus;
    }

}
