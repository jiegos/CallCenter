/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.divas.model.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author igor
 */
@Entity
@Table(name = "NOTIFICATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Notification.findAll", query = "SELECT n FROM Notification n"),
    @NamedQuery(name = "Notification.findById", query = "SELECT n FROM Notification n WHERE n.id = :id"),
    @NamedQuery(name = "Notification.findByVersion", query = "SELECT n FROM Notification n WHERE n.version = :version"),
    @NamedQuery(name = "Notification.findByDat", query = "SELECT n FROM Notification n WHERE n.dat = :dat"),
    @NamedQuery(name = "Notification.findByDescription", query = "SELECT n FROM Notification n WHERE n.description = :description"),
    @NamedQuery(name = "Notification.findByUserId", query = "SELECT n FROM Notification n WHERE n.userId = :userId"),
    @NamedQuery(name = "Notification.findByServer", query = "SELECT n FROM Notification n WHERE n.server = :server"),
    @NamedQuery(name = "Notification.findByClient", query = "SELECT n FROM Notification n WHERE n.client = :client"),
    @NamedQuery(name = "Notification.findByTrgName", query = "SELECT n FROM Notification n WHERE n.trgName = :trgName"),
    @NamedQuery(name = "Notification.findByUserLogin", query = "SELECT n FROM Notification n WHERE n.userLogin = :userLogin")})
public class Notification implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VERSION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date version;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DAT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dat;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "USER_ID")
    private String userId;
    @Column(name = "SERVER")
    private Short server;
    @Column(name = "CLIENT")
    private Short client;
    @Size(max = 50)
    @Column(name = "TRG_NAME")
    private String trgName;
    @Size(max = 50)
    @Column(name = "USER_LOGIN")
    private String userLogin;
    @JoinColumn(name = "CONTACT", referencedColumnName = "ID")
    @ManyToOne(fetch = FetchType.EAGER)
    private ContactDetails contact;

    public Notification() {
    }

    public Notification(String id) {
        this.id = id;
    }

    public Notification(String id, Date version, Date dat, String description, String userId) {
        this.id = id;
        this.version = version;
        this.dat = dat;
        this.description = description;
        this.userId = userId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getVersion() {
        return version;
    }

    public void setVersion(Date version) {
        this.version = version;
    }

    public Date getDat() {
        return dat;
    }

    public void setDat(Date dat) {
        this.dat = dat;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Short getServer() {
        return server;
    }

    public void setServer(Short server) {
        this.server = server;
    }

    public Short getClient() {
        return client;
    }

    public void setClient(Short client) {
        this.client = client;
    }

    public String getTrgName() {
        return trgName;
    }

    public void setTrgName(String trgName) {
        this.trgName = trgName;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
    }

    public ContactDetails getContact() {
        return contact;
    }

    public void setContact(ContactDetails contact) {
        this.contact = contact;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notification)) {
            return false;
        }
        Notification other = (Notification) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.Notification[ id=" + id + " ]";
    }
    
}
