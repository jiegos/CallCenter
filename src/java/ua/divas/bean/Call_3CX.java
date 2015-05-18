package ua.divas.bean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

@ManagedBean
@RequestScoped
public class Call_3CX {

    public Call_3CX() {
    }

    private String from;
    private String to;
    private String pin;
    private final String USER_AGENT = "Mozilla/34.0";
    private String newUrl;

    public void sendPost() throws Exception {
        
     
        String url = "http://192.168.1.100:5000/ivr/PbxAPI.aspx";
 
		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(url);
                HttpResponse response;
		// add header
		post.setHeader("User-Agent", USER_AGENT);
 
		List<NameValuePair> urlParameters = new ArrayList<>();
		urlParameters.add(new BasicNameValuePair("func", "make_call"));
		urlParameters.add(new BasicNameValuePair("from", "100"));
		urlParameters.add(new BasicNameValuePair("to", "101"));
		urlParameters.add(new BasicNameValuePair("pin", "qwerty"));
              
 
		 try {
            post.setEntity(new UrlEncodedFormEntity(urlParameters));
            response = client.execute(post);
            

            System.out.println(EntityUtils.toString(response.getEntity()));
            System.out.println(response.getFirstHeader("Location"));
            newUrl = response.getFirstHeader("Location").getValue();
                     System.out.println(newUrl);
        } catch (IOException e) {
            System.out.println("Ошибка");
        }
        post = new HttpPost(newUrl);
        post.setHeader("User-Agent", USER_AGENT);
        post.setEntity(new UrlEncodedFormEntity(urlParameters));
        response = client.execute(post);
    }
    
    
    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getNewUrl() {
        return newUrl;
    }

    public void setNewUrl(String newUrl) {
        this.newUrl = newUrl;
    }
}
