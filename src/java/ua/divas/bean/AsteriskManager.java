package ua.divas.bean;

import java.io.IOException;
import java.util.Date;
import org.asteriskjava.manager.AbstractManagerEventListener;
import org.asteriskjava.manager.AuthenticationFailedException;
import org.asteriskjava.manager.ManagerConnection;
import org.asteriskjava.manager.ManagerConnectionFactory;
import org.asteriskjava.manager.TimeoutException;
import org.asteriskjava.manager.action.OriginateAction;
import org.asteriskjava.manager.event.CdrEvent;
import org.asteriskjava.manager.response.ManagerResponse;
import org.primefaces.push.PushContext;
import org.primefaces.push.PushContextFactory;

public class AsteriskManager extends AbstractManagerEventListener {

    public AsteriskManager() {

    }

    private ManagerConnection managerConnection;
    
    public String number;
    private String channel;
    
    public AsteriskManager(String number, String channel) throws IOException, IllegalArgumentException, TimeoutException {
        ManagerConnectionFactory factory = new ManagerConnectionFactory(
                "213.136.80.108", 5438, "admin", "30091992Igor");
        this.number = number;
        this.managerConnection = factory.createManagerConnection();
        this.channel=channel;
        run();
    }
    
   
    public void run() {

        //Create Originate action
        OriginateAction originateAction;
        ManagerResponse originateResponse;

        originateAction = new OriginateAction();
        originateAction.setChannel("SIP/100");
        originateAction.setContext("phones");
        originateAction.setExten(number);
        originateAction.setPriority(1);

        try {
            // connect to Asterisk and log in
            managerConnection.login();

            // request channel state
            //managerConnection.sendAction(new StatusAction());
        } catch (IllegalStateException | IOException | AuthenticationFailedException | TimeoutException ex) {
            System.out.println("Ошибка" + ex);
        }
        // register for events
        managerConnection.addEventListener(this);
            try {
                originateResponse = managerConnection.sendAction(originateAction, 30000);
                if(!originateResponse.getResponse().isEmpty()){status = originateResponse.getResponse();}
                System.out.println(originateResponse.getResponse());
                if (originateResponse.getResponse().equals("Success")) {
//Цикл ожидания разговора, пока не будет результата звонка (из CDR) и phone не перестанет быть равным null
                    if (phone == null) {
                        while (true) {
                            try {
                                Thread.sleep(1000);
                            } catch (InterruptedException ex) {
                                System.out.println("InterruptedExceptian "+ex);
                                break;
                            }
                            if (phone != null) {
                                break;
                            }
                        }
                    }

                    if(!phone.equals(number)) {                       
                        setErrornumber((Boolean) true);
                        PushContext pushContext = PushContextFactory.getDefault().getPushContext();        
                        pushContext.push(channel+1, null);
                    }
                }
            } catch (IOException | TimeoutException | IllegalArgumentException | IllegalStateException ex) {
                System.out.println("Ошибка " + ex);
            }
        managerConnection.logoff();
    }
    //CDR для занесения в базу
    private String id;
    private String kontragent_id;
    private String operator_id;
    private String phone;
    private String fio;
    private Date call_start;
    private Date call_answer;
    private Date call_end;
    private long all_call;
    private String call_status;
    private String comments;
    private String status;
    private Boolean errornumber = false;
//Гетеры и сетеры    

    public String getId() {
        return id;
    }
    public String getStatus() {
        return status;
    }
    public String getKontragent_id() {
        return kontragent_id;
    }
    public String getOperator_id() {
        return operator_id;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String aPhone) {
        phone = aPhone;
    }

    public String getFio() {
        return fio;
    }
    public Date getCall_start() {
        return call_start;
    }
    public Date getCall_answer() {
        return call_answer;
    }
    public Date getCall_end() {
        return call_end;
    }
    public long getAll_call() {
        return all_call;
    }
    public String getCall_status() {
        return call_status;
    }
    public String getComments() {
        return comments;
    }
//методы вылова определенных событий
    ////////////////////////////////////////////
    protected void handleEvent(CdrEvent event) {
        System.out.println("-----------CDR-------------");
        System.out.println(event);

        System.out.println("Время ответа: " + event.getAnswerTime());
        call_answer = event.getAnswerTimeAsDate();
//
//        System.out.println("Время ответа asDate: " + event.getAnswerTimeAsDate());
//        System.out.println("Канал: " + event.getChannel());
//        System.out.println("CalerId: " + event.getCallerId());

//        System.out.println("Место назначения: " + event.getDestination());
        phone = event.getDestination();

//        System.out.println("Канал назначения: " + event.getDestinationChannel());
//        System.out.println("Контекст назначения: " + event.getDestinationContext());
        call_status = event.getDisposition();

//        System.out.println("Общее время звонка: " + event.getDuration());
        all_call = event.getDuration();

//        System.out.println("Время завершения звока: " + event.getEndTime());
        call_end = event.getEndTimeAsDate();

//        System.out.println("Lastaplication: " + event.getLastApplication());
//        System.out.println("LastData: " + event.getLastData());
//
//        System.out.println("Время начала звонка: " + event.getStartTime());
        call_start = event.getStartTimeAsDate();

//        System.out.println("UniqueId: " + event.getUniqueId());
        id = event.getUniqueId();


    }


    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public Boolean getErrornumber() {
        return errornumber;
    }

    public void setErrornumber(Boolean errornumber) {
        this.errornumber = errornumber;
    }

}

