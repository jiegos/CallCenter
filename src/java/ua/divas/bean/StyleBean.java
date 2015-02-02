package ua.divas.bean;

import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class StyleBean implements Serializable{

    public StyleBean() {
    }
    private String color = "black";
    
    public void chaingColor(){
        color="red";
    }
    
    public String getColor() {       
        return color;       
    }

    public void setColor(String color) {
        this.color = color;
    }
}
