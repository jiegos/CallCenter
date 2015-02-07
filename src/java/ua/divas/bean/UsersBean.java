package ua.divas.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

@ManagedBean
@ApplicationScoped
public class UsersBean implements Serializable {

    public UsersBean() {
    }
    private static List<String> users; 
    
    @PostConstruct
    public void contruct() {
        users = new ArrayList<>();
    }

    public void addUser(String user) {
        System.out.println("Онлайн - " + user);
        users.add(user);
       
    }

    public void delUser(String user) {
        System.out.println("Оффлайн - " + user);
        users.remove(user);
       
    }

    public List<String> showUsers() {
        return users;
    }

    public int countUsers() {
        System.out.println(users.size());
        for (String s : users) {
            System.out.println(s);
        }
        return users.size();
    }

    public static Boolean findUsers(String user) {
        for (String s : users) {
            return s.compareTo(user) == 0;
        }
        return null;
    }
}
