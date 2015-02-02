/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.divas.model.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author igor
 */
@Entity
@Table(name = "COMPAIGNS_DETAILS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CompaignsDetails.findAll", query = "SELECT c FROM CompaignsDetails c"),
    @NamedQuery(name = "CompaignsDetails.findById", query = "SELECT c FROM CompaignsDetails c WHERE c.id = :id"),
    @NamedQuery(name = "CompaignsDetails.findByVersion", query = "SELECT c FROM CompaignsDetails c WHERE c.version = :version")})
public class CompaignsDetails implements Serializable {
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
    @JoinColumn(name = "KONTRAG_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Kontragents kontragId;
    @JoinColumn(name = "CONTACT_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private ContactDetails contactId;
    @JoinColumn(name = "COMPAIGN_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Compaigns compaignId;
    @OneToMany(mappedBy = "compDetId")
    private Collection<CallLog> callLogCollection;

    public CompaignsDetails() {
    }

    public CompaignsDetails(String id) {
        this.id = id;
    }

    public CompaignsDetails(String id, Date version) {
        this.id = id;
        this.version = version;
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

    public Kontragents getKontragId() {
        return kontragId;
    }

    public void setKontragId(Kontragents kontragId) {
        this.kontragId = kontragId;
    }

    public ContactDetails getContactId() {
        return contactId;
    }

    public void setContactId(ContactDetails contactId) {
        this.contactId = contactId;
    }

    public Compaigns getCompaignId() {
        return compaignId;
    }

    public void setCompaignId(Compaigns compaignId) {
        this.compaignId = compaignId;
    }

    @XmlTransient
    public Collection<CallLog> getCallLogCollection() {
        return callLogCollection;
    }

    public void setCallLogCollection(Collection<CallLog> callLogCollection) {
        this.callLogCollection = callLogCollection;
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
        if (!(object instanceof CompaignsDetails)) {
            return false;
        }
        CompaignsDetails other = (CompaignsDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.CompaignsDetails[ id=" + id + " ]";
    }
    
}
