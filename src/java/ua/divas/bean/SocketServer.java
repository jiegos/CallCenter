package ua.divas.bean;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.primefaces.push.PushContext;
import org.primefaces.push.PushContextFactory;
import ua.divas.model.Cdr3cxFacade;
import ua.divas.model.ContactDetailsFacade;
import ua.divas.model.KontragentsFacade;
import ua.divas.model.OperatoresPhonesFacade;
import ua.divas.model.entity.Cdr3cx;
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.OperatoresPhones;

public class SocketServer implements Serializable, Runnable {

    Thread thrd;

    public SocketServer(Cdr3cxFacade f, Cdr3cx cdr, OperatoresPhonesFacade opf, KontragentsFacade kf, ContactDetailsFacade cdf) {
        this.f = f;
        this.cdr = cdr;
        this.opf = opf;        
        this.kf = kf;        
        this.cdf = cdf;
        thrd = new Thread(this);
        thrd.start();

    }
    private OperatoresPhonesFacade opf;
    private Cdr3cxFacade f;
    private KontragentsFacade kf;
    private ContactDetailsFacade cdf;
    private Cdr3cx cdr = new Cdr3cx();
   

    public void run() {
        int port = 5002; 
        String splitBy = ",";
        String from = "";
        String to = "";
        String time_call = "";
        String duration_call = "";
        String status_call = "";

        try {

            ServerSocket ss = new ServerSocket(port); // создаем сокет сервера и привязываем его к вышеуказанному порту

            Socket socket = ss.accept(); // заставляем сервер ждать подключений и выводим сообщение когда кто-то связался с сервером
            System.out.println(socket);

            // Берем входной и выходной потоки сокета, теперь можем получать и отсылать данные клиенту. 
            InputStream sin = socket.getInputStream();

            // Конвертируем потоки в другой тип, чтоб легче обрабатывать текстовые сообщения.
            BufferedReader in = new BufferedReader(new InputStreamReader(sin));

            String line = null;
            int i = 0;
            while (true) {

                line = in.readLine(); // ожидаем пока клиент пришлет строку текста.
                //           System.out.println(line);
                String[] words = line.split(splitBy);

                if (i == 1) {
                    from = words[6];
                    to = words[7];
                    System.out.println(from + " позвонил " + to);                  

                }
                if (i == 3) {
                    time_call = words[5];
                    duration_call = words[6];
                    status_call = words[8];
                    System.out.println("время звонка " + time_call + " продолжительность звонка " + duration_call + " статус звонка " + status_call);
                    //int duration = Integer.parseInt(duration_call);

                }
                i++;
                if (i > 3) {
                  
                    DateFormat format = new SimpleDateFormat("ddMMyyHHmmss", Locale.ENGLISH);
                    Date date = null;
                    date = format.parse(time_call);
                   
                    System.out.println(date);
                    java.sql.Date sqlDate = new java.sql.Date(date.getTime());

                    String s = duration_call.substring(0, duration_call.indexOf('.'));
                    String[] seconds = s.split(":");
                    int d = Integer.parseInt(seconds[0]) * 3600 + Integer.parseInt(seconds[1]) * 60 + Integer.parseInt(seconds[2]);
                    
                    String opratorName="";
                    for(OperatoresPhones op : opf.findAll()){
                        if(from.equals(op.getPhone())){                           
                            cdr.setUserId(opratorName = op.getOperator());
                        }
                    }
                    for(ContactDetails cd : cdf.findAll()){
                        if(to.equals(cd.getPhone())){                           
                            cdr.setKontragentId(cd.getKontragId().getId());
                        }
                    }
                    cdr.setPhone(to);
                    cdr.setCallStatus(status_call);
                    cdr.setDuration((long) d);
                    cdr.setId(UUID.randomUUID().toString());
                    cdr.setCallStartTime(sqlDate);

                    System.out.println("Добавление в базу " + cdr);
                    f.create(cdr);
                    System.out.println("Добавлено");
                    i = 0;
                    
                    PushContext pushContext = PushContextFactory.getDefault().getPushContext();
                    pushContext.push("/"+opratorName+"2", cdr.getId());
                }

            }
        } catch (IOException x) {
            System.out.println("Ошибка" + x);
        } catch (ParseException ex) {
            Logger.getLogger(SocketServer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
