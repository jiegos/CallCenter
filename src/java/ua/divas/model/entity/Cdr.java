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
@Table(name = "CDR")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cdr.findAll", query = "SELECT c FROM Cdr c"),
    @NamedQuery(name = "Cdr.findById", query = "SELECT c FROM Cdr c WHERE c.id = :id"),    
    @NamedQuery(name = "Cdr.findByUserId", query = "SELECT c FROM Cdr c WHERE c.userId = :userId"),
    @NamedQuery(name = "Cdr.findByKontragentId", query = "SELECT c FROM Cdr c WHERE c.kontragentId = :kontragentId"),
    @NamedQuery(name = "Cdr.findByCallStartTime", query = "SELECT c FROM Cdr c WHERE c.callStartTime = :callStartTime"),
    @NamedQuery(name = "Cdr.findByCallAnswerTime", query = "SELECT c FROM Cdr c WHERE c.callAnswerTime = :callAnswerTime"),
    @NamedQuery(name = "Cdr.findByCallEndTime", query = "SELECT c FROM Cdr c WHERE c.callEndTime = :callEndTime"),
    @NamedQuery(name = "Cdr.findByAllCallTime", query = "SELECT c FROM Cdr c WHERE c.allCallTime = :allCallTime"),
    @NamedQuery(name = "Cdr.findByCallStatus", query = "SELECT c FROM Cdr c WHERE c.callStatus = :callStatus"),})
public class Cdr implements Serializable {
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PHONE")
    private String phone;
    @Size(max = 50)
    @Column(name = "USER_ID")
    private String userId;
    @JoinColumn(name = "KONTRAGENT_ID", referencedColumnName = "ID")
    @ManyToOne
    private Kontragents kontragentId;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation

    private static final long serialVersionUID = 1L;
    @Id
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;    
    @Column(name = "CALL_START_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date callStartTime;
    @Column(name = "CALL_ANSWER_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date callAnswerTime;
    @Column(name = "CALL_END_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date callEndTime;
    @Column(name = "ALL_CALL_TIME")
    private Long allCallTime;
    @Size(max = 20)
    @Column(name = "CALL_STATUS")
    private String callStatus;

    public Cdr() {
    }

    public Cdr(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }  

    public Date getCallStartTime() {
        return callStartTime;
    }

    public void setCallStartTime(Date callStartTime) {
        this.callStartTime = callStartTime;
    }

    public Date getCallAnswerTime() {
        return callAnswerTime;
    }

    public void setCallAnswerTime(Date callAnswerTime) {
        this.callAnswerTime = callAnswerTime;
    }

    public Date getCallEndTime() {
        return callEndTime;
    }

    public void setCallEndTime(Date callEndTime) {
        this.callEndTime = callEndTime;
    }

    public Long getAllCallTime() {
        return allCallTime;
    }

    public void setAllCallTime(Long allCallTime) {
        this.allCallTime = allCallTime;
    }

    public String getCallStatus() {
        return callStatus;
    }

    public void setCallStatus(String callStatus) {
        this.callStatus = callStatus;
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
        if (!(object instanceof Cdr)) {
            return false;
        }
        Cdr other = (Cdr) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.Cdr[ id=" + id + " "+this.hashCode()+ " ]";
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Kontragents getKontragentId() {
        return kontragentId;
    }

    public void setKontragentId(Kontragents kontragentId) {
        this.kontragentId = kontragentId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
