package ua.divas.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import ua.divas.model.CallListsFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.CallLists;
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

    @EJB
    private UsersFacade uf;
    Users usr;

    @EJB
    private CallListsFacade clf;
    CallLists cl;

    private List<ContactDetails> table;
    private List<ContactDetails> table2;
    private List<ContactDetails> selectedRows;
    private ContactDetails selectedRow;
    private String listname;
    private String fio;
    private String phone;
    private String email;
    private String adress;

//Заполнение таблицы контрагентов 
//    @PostConstruct
    public void findAll() {
        System.out.println("-----------Поиск всех контрагентов ------------");
        table = cdf.findAll();
        table2 = new ArrayList<>();
        System.out.println("-----------Поиск контрагентов для текущего оператора------------");
        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            for(ContactDetails cd : table){
                if(cd.getKontragId().getUserId().getLogin().equals(userlogin)){
                    table2.add(cd);
                }
            }
        }
        table=table2;
        System.out.println("------------Контрагенты найдены-------------");
    }

//Сохранение выбранных номеров(строк) в базе с названием листа  
    public void buttonSaveList(ActionEvent actionEvent) {
        for (ContactDetails n : getSelectedRows()) {
            cl = new CallLists();
            cl.setId(UUID.randomUUID().toString());

            Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
            Login bean = (Login) sessionMap.get("login");
            if (bean != null) {
                String userlogin = bean.getUsr();
                for (Users u : uf.findByLogin(userlogin)) {
                    cl.setUsersId(u.getId());
                }
            }
            cl.setKontragentsId(n.getKontragId());
            cl.setListName(listname);
            long time = System.currentTimeMillis();
            Date data = new Date(time);
            cl.setVersion(new Timestamp(data.getTime()));
            clf.create(cl);
        }
    }

//Добавление нового контрагента в базу
    public void createKontragent(ActionEvent actionEvent) {
        details = new ContactDetails();
        kontr = new Kontragents();

        long time = System.currentTimeMillis();
        Date data = new Date(time);

        kontr.setId(UUID.randomUUID().toString());
        kontr.setVersion(new Timestamp(data.getTime()));

        Map sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Login bean = (Login) sessionMap.get("login");
        if (bean != null) {
            String userlogin = bean.getUsr();
            for (Users u : uf.findByLogin(userlogin)) {
                kontr.setUserId(u);
            }
        }

        kontr.setPredefined((short) 0);
        kontr.setUrFiz((short) 0);
        kontr.setDeleted((short) 0);
        kontr.setIsGroup((short) 0);
        kontr.setIsSupplier((short) 0);
        kontr.setIsMeasurer((short) 0);
        kontr.setIsBuyer((short) 1);
        kontr.setFullname(fio);
        
        for(Kontragents k : kf.findByFullname("Покупатели")){
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
    }
//Изменение дынных
    public void editKontragent(){
        kontr = kf.findById(selectedRow.getKontragId().getId());
        kontr.setFullname(selectedRow.getKontragId().getFullname());
        
        details = new ContactDetails();
        details.setPhone(selectedRow.getPhone());
        details.setId(UUID.randomUUID().toString());
         long time = System.currentTimeMillis();
        Date data = new Date(time);
        details.setVersion(new Timestamp(data.getTime()));
        details.setPhone(phone);
        details.setKontragId(kontr);
        cdf.create(details);
        kf.edit(kontr);
        System.out.println("Изменения контрагента " + kontr);
    }
    
//Измененние данных о клинте

    public void editClient(ActionEvent actionEvent) {
        kontr = kf.findById(selectedRow.getKontragId().getId());
        kontr.setFullname(selectedRow.getKontragId().getFullname());
        System.out.println(selectedRow.getKontragId().getId());
        for (ContactDetails d : cdf.findByKontragentId(kontr)) {
            details = d;
        }
        details.setPhone(selectedRow.getPhone());
        cdf.edit(details);
        kf.edit(kontr);
        System.out.println("Изменения контрагента " + kontr);
    }

//Удаление данных о клинте
    public void deleteClient(ActionEvent actionEvent) {
        kontr = kf.findById(selectedRow.getKontragId().getId());
        System.out.println(kontr);
        kf.remove(kontr);
        System.out.println("Удаление контрагента " + kontr);
        selectedRow=null;
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

}
