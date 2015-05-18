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
import javax.persistence.Id;
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
@Table(name = "CDR_3CX")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cdr3cx.findAll", query = "SELECT c FROM Cdr3cx c"),
    @NamedQuery(name = "Cdr3cx.findById", query = "SELECT c FROM Cdr3cx c WHERE c.id = :id"),
    @NamedQuery(name = "Cdr3cx.findByKontragentId", query = "SELECT c FROM Cdr3cx c WHERE c.kontragentId = :kontragentId"),
    @NamedQuery(name = "Cdr3cx.findByUserId", query = "SELECT c FROM Cdr3cx c WHERE c.userId = :userId"),
    @NamedQuery(name = "Cdr3cx.findByCallStartTime", query = "SELECT c FROM Cdr3cx c WHERE c.callStartTime = :callStartTime"),
    @NamedQuery(name = "Cdr3cx.findByDuration", query = "SELECT c FROM Cdr3cx c WHERE c.duration = :duration"),
    @NamedQuery(name = "Cdr3cx.findByCallStatus", query = "SELECT c FROM Cdr3cx c WHERE c.callStatus = :callStatus"),
    @NamedQuery(name = "Cdr3cx.findByPhone", query = "SELECT c FROM Cdr3cx c WHERE c.phone = :phone")})
public class Cdr3cx implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Size(max = 50)
    @Column(name = "KONTRAGENT_ID")
    private String kontragentId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "USER_ID")
    private String userId;
    @Column(name = "CALL_START_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date callStartTime;
    @Column(name = "DURATION")
    private Long duration;
    @Size(max = 20)
    @Column(name = "CALL_STATUS")
    private String callStatus;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PHONE")
    private String phone;

    public Cdr3cx() {
    }

    public Cdr3cx(String id) {
        this.id = id;
    }

    public Cdr3cx(String id, String userId, String phone) {
        this.id = id;
        this.userId = userId;
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getKontragentId() {
        return kontragentId;
    }

    public void setKontragentId(String kontragentId) {
        this.kontragentId = kontragentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCallStartTime() {
        return callStartTime;
    }

    public void setCallStartTime(Date callStartTime) {
        this.callStartTime = callStartTime;
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(Long duration) {
        this.duration = duration;
    }

    public String getCallStatus() {
        return callStatus;
    }

    public void setCallStatus(String callStatus) {
        this.callStatus = callStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
        if (!(object instanceof Cdr3cx)) {
            return false;
        }
        Cdr3cx other = (Cdr3cx) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.Cdr3cx[ id=" + id + " ]";
    }
    
}
