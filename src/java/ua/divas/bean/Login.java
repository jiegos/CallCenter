package ua.divas.bean;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.UUID;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.context.RequestContext;
import ua.divas.model.UsersFacade;
import ua.divas.model.entity.Users;

@SessionScoped
@ManagedBean
public class Login implements Serializable {

    public Login() {
    }
    @EJB
    private UsersFacade uf;
    Users user = new Users();

    @ManagedProperty(value = "#{usersBean}")
    private UsersBean bean;
    private String usr;
    private String pass;
    private String firstname;
    private String lastname;
    private String email;
    public boolean isLogged=false;
  
//Метод для проверки наличия пользователя и пароля в базе     
    public String loginControl(){
       if(uf.logincheck(usr, md5(pass))){      
             isLogged=true;
             bean.addUser(usr);
             return "welcome.xhtml?faces-redirect=true";
       }
       
       RequestContext.getCurrentInstance().update("growl");
       FacesContext context = FacesContext.getCurrentInstance();
       context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,"Ошибка","Неправильный логин или пароль!"));
       return "";
    }
    public String logout(){        
        isLogged=false;
        bean.delUser(usr);
        return "index.xhtml?faces-redirect=true";
    }
    private static String md5(String input) {

        String md5 = null;
        
        if (null == input) {
            return null;
        }

        try {
            //Create MessageDigest object for MD5
            MessageDigest digest = MessageDigest.getInstance("MD5");
            //Update input string in message digest
            digest.update(input.getBytes(), 0, input.length());
            //Converts message digest value in base 16 (hex) 
            md5 = new BigInteger(1, digest.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Ошибка" + e);
        }
        return md5;
    }

    public void registr() {
        user.setId(UUID.randomUUID().toString());
        long time = System.currentTimeMillis();
        Date data = new Date(time);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setPassWd(md5(pass));
        user.setVersion(new Timestamp(data.getTime()));
        user.setPredefined((short) 0);
        user.setIsAdmin((short) 0);
        user.setEmail(email);
        user.setLogin(usr);
        uf.create(user);
        System.out.println("Добавление пользователя в базу данных");
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UsersBean getBean() {
        return bean;
    }

    public void setBean(UsersBean bean) {
        this.bean = bean;
    }

}
