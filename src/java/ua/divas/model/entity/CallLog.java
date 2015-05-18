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
@Table(name = "CALL_LOG")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CallLog.findAll", query = "SELECT c FROM CallLog c"),
    @NamedQuery(name = "CallLog.findById", query = "SELECT c FROM CallLog c WHERE c.id = :id"),    
    @NamedQuery(name = "CallLog.findByContact_Id", query = "SELECT c FROM CallLog c WHERE c.contactId = :contactId"),
    @NamedQuery(name = "CallLog.findByMemo", query = "SELECT c FROM CallLog c WHERE c.memo = :memo"),
    @NamedQuery(name = "CallLog.findByVersion", query = "SELECT c FROM CallLog c WHERE c.version = :version"),
    @NamedQuery(name = "CallLog.findByDat", query = "SELECT c FROM CallLog c WHERE c.dat = :dat")})
public class CallLog implements Serializable {
    @JoinColumn(name = "CALL_RESULTS", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private CallResults callResults;
    @Basic(optional = false)    
    @Size(min = 1, max = 50)
    @Column(name = "CALL_RESULTS")    
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Size(max = 2000)
    @Column(name = "MEMO")
    private String memo;
    @Basic(optional = false)
    @Column(name = "VERSION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date version;
    @Basic(optional = false)
    @Column(name = "DAT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dat;
    @JoinColumn(name = "CONTACT_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private ContactDetails contactId;
    @JoinColumn(name = "COMP_DET_ID", referencedColumnName = "ID")
    @ManyToOne
    private CompaignsDetails compDetId;
    @JoinColumn(name = "CALL_STATUS", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private CallStatus callStatus;

    public CallLog() {
    }

    public CallLog(String id) {
        this.id = id;
    }

    public CallLog(String id, Date version, Date dat) {
        this.id = id;
        this.version = version;
        this.dat = dat;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
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

    public ContactDetails getContactId() {
        return contactId;
    }

    public void setContactId(ContactDetails contactId) {
        this.contactId = contactId;
    }

    public CompaignsDetails getCompDetId() {
        return compDetId;
    }

    public void setCompDetId(CompaignsDetails compDetId) {
        this.compDetId = compDetId;
    }

    public CallStatus getCallStatus() {
        return callStatus;
    }

    public void setCallStatus(CallStatus callStatus) {
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
        if (!(object instanceof CallLog)) {
            return false;
        }
        CallLog other = (CallLog) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.CallLog[ id=" + id + " ]";
    }


    public CallResults getCallResults() {
        return callResults;
    }

    public void setCallResults(CallResults callResults) {
        this.callResults = callResults;
    }
    
}
