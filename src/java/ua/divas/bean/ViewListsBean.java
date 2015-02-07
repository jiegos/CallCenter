package ua.divas.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
import org.primefaces.event.CloseEvent;
import org.primefaces.event.SelectEvent;
import ua.divas.model.CallListsFacade;
import ua.divas.model.CallLogFacade;
import ua.divas.model.CallResultsFacade;
import ua.divas.model.CallStatusFacade;
import ua.divas.model.CdrFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.CallLists;
import ua.divas.model.entity.CallLog;
import ua.divas.model.entity.CallResults;
import ua.divas.model.entity.CallStatus;
import ua.divas.model.entity.Cdr;
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.Kontragents;
import ua.divas.model.entity.Users;

@SessionScoped
@ManagedBean
public class ViewListsBean implements Serializable {

    public ViewListsBean() {

    }
    @EJB
    private CallListsFacade clf;

    @EJB
    private UsersFacade uf;

    @EJB
    private ContactDetailsFacade cdf;
    ContactDetails details;

    @EJB
    private CallLogFacade logf;
    CallLog log = new CallLog();

    @EJB
    private CallResultsFacade resf;
    CallResults result = new CallResults();

    @EJB
    private CallStatusFacade csf;
    CallStatus status = new CallStatus();

    private ArrayList<String> list;
    @EJB
    private CdrFacade f;
    Cdr cdr = new Cdr();
    @ManagedProperty(value = "#{remainderBean}")
    private RemainderBean remainderBeanChannel;
    
    @ManagedProperty(value = "#{operatorInfoBean}")
    private OperatorInfoBean infoBean;

    private String userlogin;

    private List<CallLists> table;
    private List<CallLists> viewtable;
    private ArrayList<String> viewlists;
    private ArrayList<String> table2;
    private List<CallLists> selectedLists;
    private List<Kontragents> selectedLists2;    
    private ArrayList<ContactDetails> selectedLists1;
    private ArrayList<ContactDetails> selectedLists3;
    private ArrayList<ContactDetails> selectedLists4;
    private String header;
    private String tablename;
    private String fullname;
    private String fullname2;
    private CallLists selectedList;
    private Boolean render = false;
    private Boolean render2 = false;
    private Boolean render3 = true;
    private Boolean render4 = false;
    private Boolean render5 = false;
    private Boolean pollstop = false;
    private Boolean callcheck;
    private CallListThread clt;
    private ArrayList<String> list2;
    private int countcall = 0;
    private String leftcall;
    private String allcall;
    private String comment;
    private String statuscall;
    private Boolean continuecall = true;
    private String buttontitle;
    private String newlistname;
//Поиск созданых листов оператора и отображение

    @PostConstruct
    public void construct() {
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            userlogin = bean.getUsr();
        }
    }

    public void findLists() {
        System.out.println("-----------Поиск всех листов------------ ");
        table = new ArrayList<>();

        for (Users u : uf.findByLogin(userlogin)) {
            table = clf.findByUsersId(u.getId());
        }

        viewtable = table;
        if (getTable().isEmpty()) {
            System.out.println("-----------Листы не найдены-----------");
            System.out.println("");
        } else {
            System.out.println("-------------Листы найдены----------");
            System.out.println("");
        }
        viewlists = new ArrayList<>();
        for (CallLists l : viewtable) {
            if (!viewlists.contains(l.getListName())) {
                viewlists.add(l.getListName());
            }
        }
        table2 = viewlists;

    }

//Оброботка события выбора строки
    public void onRowSelect(SelectEvent event) {
        System.out.println("Выбрано строку - " + event.getObject().toString());

        for (Users u : uf.findByLogin(userlogin)) {
            selectedLists = clf.findByUsersIdAndListName(u.getId(), event.getObject().toString());
        }

        selectedLists2 = new ArrayList<>();
        for (CallLists cl : selectedLists) {
            if (!selectedLists2.contains(cl.getKontragentsId())) {
                selectedLists2.add(cl.getKontragentsId());
            }
        }
        selectedLists3 = new ArrayList<>();
        for (Kontragents k : selectedLists2) {
            for (ContactDetails cd : cdf.findByKontragentId(k)) {
                selectedLists3.add(cd);
            }
        }
        
        selectedLists1 = new ArrayList<>();
        ArrayList<Kontragents> tmp = new ArrayList<>();
        for (ContactDetails cd : selectedLists3) {
            if (cd.getKontragId().getUserId().getLogin().equals(getUserlogin())) {
                if (!tmp.contains(cd.getKontragId())) {
                    selectedLists1.add(cd);
                    tmp.add(cd.getKontragId());
                }
            }
        }
        header = event.getObject().toString();
        render = false;
        render2 = true;
        render3 = false;
        render4 = true;

        RequestContext.getCurrentInstance().update("selectListForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().update("checkAgentsForm");
    }

//Обзвон выбраного списка
    public void buttonCallLists(ActionEvent actionEvent) {
        list = new ArrayList<>();
        String UserId = null;

        for (Users u : uf.findByLogin(userlogin)) {
            UserId = u.getId();
        }

        for (ContactDetails cd : selectedLists1) {
            list.add(cd.getPhone());
        }
        leftcall = "" + selectedLists1.size();
        pollstop = false;
        clt = new CallListThread(f, UserId, list, selectedLists1, remainderBeanChannel.getChannel());
        allcall = "" + selectedLists1.size();
        countcall = 0;
        fullname = (selectedLists1.get(countcall).getKontragId().getFullname());
        if (selectedLists1.size() > 1) {
            fullname2 = (selectedLists1.get(countcall + 1).getKontragId().getFullname());
        } else {
            fullname2 = "Звонить больше некому";
        }
        buttontitle = "Продолжить";
        continuecall = true;
        RequestContext.getCurrentInstance().update("callForm");
        RequestContext.getCurrentInstance().update("resultCallForm");
        RequestContext.getCurrentInstance().execute("dlg5.show()");
    }
//Проверка завершен ли звонок

    public void isStopped() {
        if (!clt.getPollstop() && !clt.getError()) {
            System.out.println("Идет звонок!");
        } else {
            infoBean.construct();        
            RequestContext.getCurrentInstance().update("infoForm");
            RequestContext.getCurrentInstance().update("resultCallForm:cb10");
            RequestContext.getCurrentInstance().update("resultCallForm:cb11");
            System.out.println("Звонок прекращен");
            countcall++;
            if ((countcall) < (selectedLists1.size())) {
                list2 = clt.getList2();
                selectedLists4 = clt.getSelectedLists4();
                leftcall = "" + selectedLists4.size();
            } else {
                leftcall = "" + 0;
                selectedLists4 = null;
                list2 = null;
                allcall = null;
                buttontitle = "Завершить";
            }
            continuecall = false;
            pollstop = true;
            clt.setCallcheck(callcheck = false);
        }
    }
//Кнопка

    public void testButton() {
        FacesMessage message = new FacesMessage("При наборе номера произошла ошибка!");
        FacesContext.getCurrentInstance().addMessage(null, message);
        
        infoBean.construct();        
        RequestContext.getCurrentInstance().update("infoForm");
        
        RequestContext.getCurrentInstance().update("resultCallForm:cb10");
        RequestContext.getCurrentInstance().update("resultCallForm:cb11");
        System.out.println("Звонок прекращен");
        countcall++;
        if ((countcall) < (selectedLists1.size())) {
            list2 = clt.getList2();
            selectedLists4 = clt.getSelectedLists4();
            leftcall = "" + selectedLists4.size();
        } else {
            leftcall = "" + 0;
            selectedLists4 = null;
            list2 = null;
            allcall = null;
            buttontitle = "Завершить";
        }
        continuecall = false;
        pollstop = true;
        clt.setCallcheck(callcheck = false);
    }
//Закрытие диалога

    public void onClose(CloseEvent event) {
        System.out.println("Закрыли диалог");
        stopCall();
    }

//Остановка обзвона
    public void stopCall() {
        RequestContext.getCurrentInstance().execute("dlg5.hide()");
        clt.setCallcheck(callcheck = false);
        selectedLists4 = null;
        list2 = null;
        pollstop = true;
        countcall = 0;
        allcall = null;
        continuecall = true;
    }

//Продолжить обзвон
    public void continueCall() {
        RequestContext.getCurrentInstance().execute("p7.start()");

        String UserId = null;

            for (Users u : uf.findByLogin(userlogin)) {
                UserId = u.getId();
            }
      

//Заполнение CallLog---------START--------
        for (CallResults r : resf.findAll()) {
            if (r.getFullname().compareTo(statuscall) == 0) {
                log.setCallResults(r);
            }
        }
        for (CallStatus s : csf.findAll()) {
            if (!clt.getError() && clt.cdr.getCallStatus() != null) {

                if (s.getName().compareTo(clt.cdr.getCallStatus()) == 0) {
                    log.setCallStatus(s);
                }

            } else {
                log.setCallStatus(csf.findAll().get(1));
                list2 = clt.getList2();
                selectedLists4 = clt.getSelectedLists4();
                break;
            }
        }
        log.setCompDetId(null);
        log.setContactId(selectedLists1.get(countcall - 1));
        log.setDat(new Date());
        log.setMemo(comment);
        log.setId(UUID.randomUUID().toString());
        long time = System.currentTimeMillis();
        java.sql.Date data = new java.sql.Date(time);
        log.setVersion(new Timestamp(data.getTime()));
        logf.create(log);
        System.out.println("Доблавление в базу " + log);
//СallLog -------------------------END-----------------------

        if (selectedLists4 != null) {
            clt = new CallListThread(f, UserId, list2, selectedLists4, remainderBeanChannel.getChannel());
            continuecall = true;
        }

        if ((selectedLists1.size() - countcall) > 1) {
            fullname = (selectedLists1.get(countcall).getKontragId().getFullname());
            fullname2 = (selectedLists1.get(countcall + 1).getKontragId().getFullname());
        }
        if ((selectedLists1.size() - countcall) == 1) {
            fullname = (selectedLists1.get(countcall).getKontragId().getFullname());
            fullname2 = "Звонить больше некому";
        }
        if ((selectedLists1.size() - countcall) == 0) {
            countcall = 0;
            RequestContext.getCurrentInstance().execute("dlg5.hide()");
            pollstop = true;
        } else {
            pollstop = false;
        }
        RequestContext.getCurrentInstance().update("callForm");
        RequestContext.getCurrentInstance().update("resultCallForm");
        comment = null;
        statuscall = null;
        list2 = null;
        selectedLists4 = null;
    }

//Меню - Листы обзвона - Кнопка "Показать все"

    public void showAllLists() {
        findLists();
        render4 = true;
        render5 = false;
        RequestContext.getCurrentInstance().update("callListsForm");
        RequestContext.getCurrentInstance().update("fileForm");
    }
//Меню - Листы обзвона - Кнопка "Создать"

    public void addList() {
        render = true;
        render2 = false;
        render3 = false;
        render4 = false;
        render5 = false;
        tablename = "Создание листа обзвона";

        RequestContext.getCurrentInstance().update("selectListForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().update("checkAgentsForm");
        RequestContext.getCurrentInstance().update("fileForm");
        RequestContext.getCurrentInstance().update("callListsForm");
    }
//Меню - Листы обзвона - Кнопка "Загрузить"

    public void showUpload() {
        render4 = false;
        render5 = true;
        RequestContext.getCurrentInstance().update("fileForm");
        RequestContext.getCurrentInstance().update("callListsForm");
    }

//Удалить лист
    public void deleteList(ActionEvent actionEvent) {
        System.out.println("---------------------Удаление листа " + header);

        System.out.println(getUserlogin());
        for (CallLists l : selectedLists) {
            if (l.getListName().equals(header)) {
                for (Users u : uf.findByLogin(userlogin)) {
                    if (l.getUsersId().equals(u.getId())) {
                        clf.remove(l);
                        System.out.println("--------------Успешно--------------");
                    }
                }
            }
        }

        render = true;
        render2 = false;
        render3 = false;
        render4 = true;
        findLists();
        tablename = "Создание листа обзвона";
        RequestContext.getCurrentInstance().update("checkAgentsForm");
        RequestContext.getCurrentInstance().update("selectListForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().update("callListsForm");
    }
//Изменить название листа

    public void editNameList() {
        System.out.println("---------------------Изменение названия листа " + header);
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            System.out.println(userlogin);
            for (CallLists l : selectedLists) {
                if (l.getListName().equals(header)) {
                    for (Users u : uf.findByLogin(userlogin)) {
                        if (l.getUsersId().equals(u.getId())) {
                            l.setListName(newlistname);
                            clf.edit(l);
                            System.out.println("--------------Успешно--------------");
                        }
                    }
                }
            }
        }

        render = false;
        render2 = true;
        render3 = false;
        render4 = true;
        header = newlistname;
        findLists();
        RequestContext.getCurrentInstance().update("checkAgentsForm");
        RequestContext.getCurrentInstance().update("selectListForm");
        RequestContext.getCurrentInstance().update("agentsForm");
        RequestContext.getCurrentInstance().update("callListsForm");
    }

    public CallLists getSelectedList() {
        return selectedList;
    }

    public void setSelectedList(CallLists selected) {
        this.selectedList = selected;
    }

    public Boolean getRender() {
        return render;
    }

    public void setRender(Boolean render) {
        this.render = render;
    }

    public Boolean getRender2() {
        return render2;
    }

    public void setRender2(Boolean render2) {
        this.render2 = render2;
    }

    public List<CallLists> getTable() {
        return table;
    }

    public void setTable(List<CallLists> table) {
        this.table = table;
    }

    public List<CallLists> getViewtable() {
        return viewtable;
    }

    public void setViewtable(List<CallLists> viewtable) {
        this.viewtable = viewtable;
    }

    public ArrayList<String> getViewlists() {
        return viewlists;
    }

    public void setViewlists(ArrayList<String> viewlists) {
        this.viewlists = viewlists;
    }

    public List<CallLists> getSelectedLists() {
        return selectedLists;
    }

    public void setSelectedLists(List<CallLists> selectedLists) {
        this.selectedLists = selectedLists;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public Boolean getRender3() {
        return render3;
    }

    public void setRender3(Boolean render3) {
        this.render3 = render3;
    }

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename;
    }

    public Boolean getRender4() {
        return render4;
    }

    public void setRender4(Boolean render4) {
        this.render4 = render4;
    }

    public ArrayList<String> getTable2() {
        return table2;
    }

    public void setTable2(ArrayList<String> table2) {
        this.table2 = table2;
    }

    public List<Kontragents> getSelectedLists2() {
        return selectedLists2;
    }

    public void setSelectedLists2(List<Kontragents> selectedLists2) {
        this.selectedLists2 = selectedLists2;
    }

    public ArrayList<ContactDetails> getSelectedLists3() {
        return selectedLists3;
    }

    public void setSelectedLists3(ArrayList<ContactDetails> selectedLists3) {
        this.selectedLists3 = selectedLists3;
    }

//    public void setAgents(AgentsTableBean agents) {
//        this.agents = agents;
//    }
    public Boolean getRender5() {
        return render5;
    }

    public void setRender5(Boolean render5) {
        this.render5 = render5;
    }

    public Boolean getPollstop() {
        return pollstop;
    }

    public void setPollstop(Boolean pollstop) {
        this.pollstop = pollstop;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getCountcall() {
        return countcall;
    }

    public void setCountcall(int countcall) {
        this.countcall = countcall;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatuscall() {
        return statuscall;
    }

    public void setStatuscall(String statuscall) {
        this.statuscall = statuscall;
    }

    public String getLeftcall() {
        return leftcall;
    }

    public void setLeftcall(String leftcall) {
        this.leftcall = leftcall;
    }

    public Boolean getContinuecall() {
        return continuecall;
    }

    public void setContinuecall(Boolean continuecall) {
        this.continuecall = continuecall;
    }

    public String getFullname2() {
        return fullname2;
    }

    public void setFullname2(String fullname2) {
        this.fullname2 = fullname2;
    }

    public String getAllcall() {
        return allcall;
    }

    public void setAllcall(String allcall) {
        this.allcall = allcall;
    }

    public String getButtontitle() {
        return buttontitle;
    }

    public void setButtontitle(String buttontitle) {
        this.buttontitle = buttontitle;
    }

    public String getNewlistname() {
        return newlistname;
    }

    public void setNewlistname(String newlistname) {
        this.newlistname = newlistname;
    }

    public RemainderBean getRemainderBeanChannel() {
        return remainderBeanChannel;
    }

    public void setRemainderBeanChannel(RemainderBean remainderBeanChannel) {
        this.remainderBeanChannel = remainderBeanChannel;
    }

    public String getUserlogin() {
        return userlogin;
    }

    public void setUserlogin(String userlogin) {
        this.userlogin = userlogin;
    }

    public ArrayList<ContactDetails> getSelectedLists1() {
        return selectedLists1;
    }

    public void setSelectedLists1(ArrayList<ContactDetails> selectedLists1) {
        this.selectedLists1 = selectedLists1;
    }

    public OperatorInfoBean getInfoBean() {
        return infoBean;
    }

    public void setInfoBean(OperatorInfoBean infoBean) {
        this.infoBean = infoBean;
    }

}
