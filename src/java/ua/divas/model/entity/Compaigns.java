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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "COMPAIGNS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Compaigns.findAll", query = "SELECT c FROM Compaigns c"),
    @NamedQuery(name = "Compaigns.findById", query = "SELECT c FROM Compaigns c WHERE c.id = :id"),
    @NamedQuery(name = "Compaigns.findByName", query = "SELECT c FROM Compaigns c WHERE c.name = :name"),
    @NamedQuery(name = "Compaigns.findByVersion", query = "SELECT c FROM Compaigns c WHERE c.version = :version"),
    @NamedQuery(name = "Compaigns.findByEnabled", query = "SELECT c FROM Compaigns c WHERE c.enabled = :enabled"),
    @NamedQuery(name = "Compaigns.findByPredefined", query = "SELECT c FROM Compaigns c WHERE c.predefined = :predefined"),
    @NamedQuery(name = "Compaigns.findByDeleted", query = "SELECT c FROM Compaigns c WHERE c.deleted = :deleted")})
public class Compaigns implements Serializable {
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
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VERSION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date version;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ENABLED")
    private short enabled;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PREDEFINED")
    private short predefined;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DELETED")
    private short deleted;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "compaignId")
    private Collection<CompaignsDetails> compaignsDetailsCollection;

    public Compaigns() {
    }

    public Compaigns(String id) {
        this.id = id;
    }

    public Compaigns(String id, String name, Date version, short enabled, short predefined, short deleted) {
        this.id = id;
        this.name = name;
        this.version = version;
        this.enabled = enabled;
        this.predefined = predefined;
        this.deleted = deleted;
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

    public Date getVersion() {
        return version;
    }

    public void setVersion(Date version) {
        this.version = version;
    }

    public short getEnabled() {
        return enabled;
    }

    public void setEnabled(short enabled) {
        this.enabled = enabled;
    }

    public short getPredefined() {
        return predefined;
    }

    public void setPredefined(short predefined) {
        this.predefined = predefined;
    }

    public short getDeleted() {
        return deleted;
    }

    public void setDeleted(short deleted) {
        this.deleted = deleted;
    }

    @XmlTransient
    public Collection<CompaignsDetails> getCompaignsDetailsCollection() {
        return compaignsDetailsCollection;
    }

    public void setCompaignsDetailsCollection(Collection<CompaignsDetails> compaignsDetailsCollection) {
        this.compaignsDetailsCollection = compaignsDetailsCollection;
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
        if (!(object instanceof Compaigns)) {
            return false;
        }
        Compaigns other = (Compaigns) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.Compaigns[ id=" + id + " ]";
    }
    
}
