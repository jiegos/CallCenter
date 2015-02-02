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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "KONTRAGENTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Kontragents.findAll", query = "SELECT k FROM Kontragents k"),
    @NamedQuery(name = "Kontragents.findById", query = "SELECT k FROM Kontragents k WHERE k.id = :id"),    
    @NamedQuery(name = "Kontragents.findByUserId", query = "SELECT k FROM Kontragents k WHERE k.userId = :userId"),
    @NamedQuery(name = "Kontragents.findByIsGroup", query = "SELECT k FROM Kontragents k WHERE k.isGroup = :isGroup"),
    @NamedQuery(name = "Kontragents.findByFullname", query = "SELECT k FROM Kontragents k WHERE k.fullname = :fullname"),
    @NamedQuery(name = "Kontragents.findByDeleted", query = "SELECT k FROM Kontragents k WHERE k.deleted = :deleted"),
    @NamedQuery(name = "Kontragents.findByInn", query = "SELECT k FROM Kontragents k WHERE k.inn = :inn"),
    @NamedQuery(name = "Kontragents.findByOkpo", query = "SELECT k FROM Kontragents k WHERE k.okpo = :okpo"),
    @NamedQuery(name = "Kontragents.findByKpp", query = "SELECT k FROM Kontragents k WHERE k.kpp = :kpp"),
    @NamedQuery(name = "Kontragents.findByNamefull", query = "SELECT k FROM Kontragents k WHERE k.namefull = :namefull"),
    @NamedQuery(name = "Kontragents.findByUrFiz", query = "SELECT k FROM Kontragents k WHERE k.urFiz = :urFiz"),
    @NamedQuery(name = "Kontragents.findByVersion", query = "SELECT k FROM Kontragents k WHERE k.version = :version"),
    @NamedQuery(name = "Kontragents.findByPredefined", query = "SELECT k FROM Kontragents k WHERE k.predefined = :predefined"),
    @NamedQuery(name = "Kontragents.findByIsBuyer", query = "SELECT k FROM Kontragents k WHERE k.isBuyer = :isBuyer"),
    @NamedQuery(name = "Kontragents.findByIsMeasurer", query = "SELECT k FROM Kontragents k WHERE k.isMeasurer = :isMeasurer"),
    @NamedQuery(name = "Kontragents.findByIsSupplier", query = "SELECT k FROM Kontragents k WHERE k.isSupplier = :isSupplier")})
public class Kontragents implements Serializable {
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "kontragId")
    private Collection<CompaignsDetails> compaignsDetailsCollection;
    @OneToMany(mappedBy = "kontragentId")
    private Collection<Cdr> cdrCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "kontragentsId")
    private Collection<CallLists> callListsCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "kontragents")
    private CallLists callLists;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "kontragId")
    private Collection<ContactDetails> contactDetailsCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IS_GROUP")
    private short isGroup;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "FULLNAME")
    private String fullname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DELETED")
    private short deleted;
    @Size(max = 50)
    @Column(name = "INN")
    private String inn;
    @Size(max = 50)
    @Column(name = "OKPO")
    private String okpo;
    @Size(max = 50)
    @Column(name = "KPP")
    private String kpp;
    @Size(max = 150)
    @Column(name = "NAMEFULL")
    private String namefull;
    @Basic(optional = false)
    @NotNull
    @Column(name = "UR_FIZ")
    private short urFiz;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VERSION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date version;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PREDEFINED")
    private short predefined;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IS_BUYER")
    private short isBuyer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IS_MEASURER")
    private short isMeasurer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IS_SUPPLIER")
    private short isSupplier;
    @JoinColumn(name = "USER_ID", referencedColumnName = "ID")
    @ManyToOne
    private Users userId;
    @OneToMany(mappedBy = "parentId")
    private Collection<Kontragents> kontragentsCollection;
    @JoinColumn(name = "PARENT_ID", referencedColumnName = "ID")
    @ManyToOne
    private Kontragents parentId;

    public Kontragents() {
    }

    public Kontragents(String id) {
        this.id = id;
    }

    public Kontragents(String id, short isGroup, String fullname, short deleted, short urFiz, Date version, short predefined, short isBuyer, short isMeasurer, short isSupplier) {
        this.id = id;
        this.isGroup = isGroup;
        this.fullname = fullname;
        this.deleted = deleted;
        this.urFiz = urFiz;
        this.version = version;
        this.predefined = predefined;
        this.isBuyer = isBuyer;
        this.isMeasurer = isMeasurer;
        this.isSupplier = isSupplier;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public short getIsGroup() {
        return isGroup;
    }

    public void setIsGroup(short isGroup) {
        this.isGroup = isGroup;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public short getDeleted() {
        return deleted;
    }

    public void setDeleted(short deleted) {
        this.deleted = deleted;
    }

    public String getInn() {
        return inn;
    }

    public void setInn(String inn) {
        this.inn = inn;
    }

    public String getOkpo() {
        return okpo;
    }

    public void setOkpo(String okpo) {
        this.okpo = okpo;
    }

    public String getKpp() {
        return kpp;
    }

    public void setKpp(String kpp) {
        this.kpp = kpp;
    }

    public String getNamefull() {
        return namefull;
    }

    public void setNamefull(String namefull) {
        this.namefull = namefull;
    }

    public short getUrFiz() {
        return urFiz;
    }

    public void setUrFiz(short urFiz) {
        this.urFiz = urFiz;
    }

    public Date getVersion() {
        return version;
    }

    public void setVersion(Date version) {
        this.version = version;
    }

    public short getPredefined() {
        return predefined;
    }

    public void setPredefined(short predefined) {
        this.predefined = predefined;
    }

    public short getIsBuyer() {
        return isBuyer;
    }

    public void setIsBuyer(short isBuyer) {
        this.isBuyer = isBuyer;
    }

    public short getIsMeasurer() {
        return isMeasurer;
    }

    public void setIsMeasurer(short isMeasurer) {
        this.isMeasurer = isMeasurer;
    }

    public short getIsSupplier() {
        return isSupplier;
    }

    public void setIsSupplier(short isSupplier) {
        this.isSupplier = isSupplier;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    @XmlTransient
    public Collection<Kontragents> getKontragentsCollection() {
        return kontragentsCollection;
    }

    public void setKontragentsCollection(Collection<Kontragents> kontragentsCollection) {
        this.kontragentsCollection = kontragentsCollection;
    }

    public Kontragents getParentId() {
        return parentId;
    }

    public void setParentId(Kontragents parentId) {
        this.parentId = parentId;
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
        if (!(object instanceof Kontragents)) {
            return false;
        }
        Kontragents other = (Kontragents) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.Kontragents[ id=" + id + " ]";
    }

    public void setVersion(TemporalType temporalType) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @XmlTransient
    public Collection<ContactDetails> getContactDetailsCollection() {
        return contactDetailsCollection;
    }

    public void setContactDetailsCollection(Collection<ContactDetails> contactDetailsCollection) {
        this.contactDetailsCollection = contactDetailsCollection;
    }

    public CallLists getCallLists() {
        return callLists;
    }

    public void setCallLists(CallLists callLists) {
        this.callLists = callLists;
    }

    @XmlTransient
    public Collection<CallLists> getCallListsCollection() {
        return callListsCollection;
    }

    public void setCallListsCollection(Collection<CallLists> callListsCollection) {
        this.callListsCollection = callListsCollection;
    }

    @XmlTransient
    public Collection<Cdr> getCdrCollection() {
        return cdrCollection;
    }

    public void setCdrCollection(Collection<Cdr> cdrCollection) {
        this.cdrCollection = cdrCollection;
    }

    @XmlTransient
    public Collection<CompaignsDetails> getCompaignsDetailsCollection() {
        return compaignsDetailsCollection;
    }

    public void setCompaignsDetailsCollection(Collection<CompaignsDetails> compaignsDetailsCollection) {
        this.compaignsDetailsCollection = compaignsDetailsCollection;
    }

    
}
