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
import javax.persistence.OneToOne;
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
@Table(name = "CALL_LISTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CallLists.findAll", query = "SELECT c FROM CallLists c"),
    @NamedQuery(name = "CallLists.findById", query = "SELECT c FROM CallLists c WHERE c.id = :id"),
    @NamedQuery(name = "CallLists.findByUsersId", query = "SELECT c FROM CallLists c WHERE c.usersId = :usersId"),
    @NamedQuery(name = "CallLists.findByKontragentsId", query = "SELECT c FROM CallLists c WHERE c.kontragentsId = :kontragentsId"),
    @NamedQuery(name = "CallLists.findByListName", query = "SELECT c FROM CallLists c WHERE c.listName = :listName"),
    @NamedQuery(name = "CallLists.findByUsersIdAndListName", query = "SELECT c FROM CallLists c WHERE c.usersId = :usersId AND c.listName = :listName"),
    @NamedQuery(name = "CallLists.findByVersion", query = "SELECT c FROM CallLists c WHERE c.version = :version")})
public class CallLists implements Serializable {
    @JoinColumn(name = "KONTRAGENTS_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Kontragents kontragentsId;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "USERS_ID")
    private String usersId;   
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LIST_NAME")
    private String listName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VERSION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date version;
    @JoinColumn(name = "ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Kontragents kontragents;

    public CallLists() {
    }

    public CallLists(String id) {
        this.id = id;
    }

    public CallLists(String id, String usersId, String kontragentsId, String listName, Date version) {
        this.id = id;
        this.usersId = usersId;
        this.listName = listName;
        this.version = version;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsersId() {
        return usersId;
    }

    public void setUsersId(String usersId) {
        this.usersId = usersId;
    }

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public Date getVersion() {
        return version;
    }

    public void setVersion(Date version) {
        this.version = version;
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
        if (!(object instanceof CallLists)) {
            return false;
        }
        CallLists other = (CallLists) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.CallLists[ id=" + id + " ]";
    }

    public Kontragents getKontragentsId() {
        return kontragentsId;
    }

    public void setKontragentsId(Kontragents kontragentsId) {
        this.kontragentsId = kontragentsId;
    }
    
}
