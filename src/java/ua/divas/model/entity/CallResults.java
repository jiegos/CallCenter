/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.divas.model.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author igor
 */
@Entity
@Table(name = "CALL_RESULTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CallResults.findAll", query = "SELECT c FROM CallResults c"),
    @NamedQuery(name = "CallResults.findById", query = "SELECT c FROM CallResults c WHERE c.id = :id"),
    @NamedQuery(name = "CallResults.findByName", query = "SELECT c FROM CallResults c WHERE c.name = :name"),
    @NamedQuery(name = "CallResults.findByFullname", query = "SELECT c FROM CallResults c WHERE c.fullname = :fullname")})
public class CallResults implements Serializable {
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "callResults")
    private Collection<CallLog> callLogCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "callResults")
    private CallLog callLog;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "FULLNAME")
    private String fullname;

    public CallResults() {
    }

    public CallResults(String id) {
        this.id = id;
    }

    public CallResults(String id, String name, String fullname) {
        this.id = id;
        this.name = name;
        this.fullname = fullname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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
        if (!(object instanceof CallResults)) {
            return false;
        }
        CallResults other = (CallResults) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.CallResults[ id=" + id + " ]";
    }

    public CallLog getCallLog() {
        return callLog;
    }

    public void setCallLog(CallLog callLog) {
        this.callLog = callLog;
    }

    @XmlTransient
    public Collection<CallLog> getCallLogCollection() {
        return callLogCollection;
    }

    public void setCallLogCollection(Collection<CallLog> callLogCollection) {
        this.callLogCollection = callLogCollection;
    }
    
}
