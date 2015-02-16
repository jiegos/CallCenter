/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.divas.model.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author igor
 */
@Entity
@Table(name = "ASTER_SETTINGS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AsterSettings.findAll", query = "SELECT a FROM AsterSettings a"),
    @NamedQuery(name = "AsterSettings.findById", query = "SELECT a FROM AsterSettings a WHERE a.id = :id"),
    @NamedQuery(name = "AsterSettings.findByServer", query = "SELECT a FROM AsterSettings a WHERE a.server = :server"),
    @NamedQuery(name = "AsterSettings.findByLoginAm", query = "SELECT a FROM AsterSettings a WHERE a.loginAm = :loginAm"),
    @NamedQuery(name = "AsterSettings.findByPassAm", query = "SELECT a FROM AsterSettings a WHERE a.passAm = :passAm"),
    @NamedQuery(name = "AsterSettings.findByChannel", query = "SELECT a FROM AsterSettings a WHERE a.channel = :channel"),
    @NamedQuery(name = "AsterSettings.findByContext", query = "SELECT a FROM AsterSettings a WHERE a.context = :context"),
    @NamedQuery(name = "AsterSettings.findByPriority", query = "SELECT a FROM AsterSettings a WHERE a.priority = :priority"),
    @NamedQuery(name = "AsterSettings.findByPort", query = "SELECT a FROM AsterSettings a WHERE a.port = :port")})
public class AsterSettings implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "SERVER")
    private String server;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "LOGIN_AM")
    private String loginAm;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "PASS_AM")
    private String passAm;
    @Size(max = 20)
    @Column(name = "CHANNEL")
    private String channel;
    @Size(max = 20)
    @Column(name = "CONTEXT")
    private String context;
    @Size(max = 20)
    @Column(name = "PRIORITY")
    private String priority;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "PORT")
    private String port;

    public AsterSettings() {
    }

    public AsterSettings(String id) {
        this.id = id;
    }

    public AsterSettings(String id, String server, String loginAm, String passAm, String port) {
        this.id = id;
        this.server = server;
        this.loginAm = loginAm;
        this.passAm = passAm;
        this.port = port;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getLoginAm() {
        return loginAm;
    }

    public void setLoginAm(String loginAm) {
        this.loginAm = loginAm;
    }

    public String getPassAm() {
        return passAm;
    }

    public void setPassAm(String passAm) {
        this.passAm = passAm;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
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
        if (!(object instanceof AsterSettings)) {
            return false;
        }
        AsterSettings other = (AsterSettings) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.AsterSettings[ id=" + id + " ]";
    }
    
}
