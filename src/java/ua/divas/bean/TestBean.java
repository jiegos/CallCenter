package ua.divas.bean;

import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class TestBean implements Serializable{

    public TestBean() {
    }
    @ManagedProperty(value = "#{usersBean}")
    private UsersBean bean;
    
    public void test(){
        System.out.println("проверка");
        System.out.println("Количество пользователей в сети - " + bean.countUsers());        
    }

    public UsersBean getBean() {
        return bean;
    }

    public void setBean(UsersBean bean) {
        this.bean = bean;
    }
}
