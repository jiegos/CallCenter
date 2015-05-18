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
@Table(name = "OPERATORES_PHONES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OperatoresPhones.findAll", query = "SELECT o FROM OperatoresPhones o"),
    @NamedQuery(name = "OperatoresPhones.findById", query = "SELECT o FROM OperatoresPhones o WHERE o.id = :id"),
    @NamedQuery(name = "OperatoresPhones.findByOperator", query = "SELECT o FROM OperatoresPhones o WHERE o.operator = :operator"),
    @NamedQuery(name = "OperatoresPhones.findByPhone", query = "SELECT o FROM OperatoresPhones o WHERE o.phone = :phone")})
public class OperatoresPhones implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "ID")
    private String id;
    @Size(max = 20)
    @Column(name = "OPERATOR")
    private String operator;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 20)
    @Column(name = "PHONE")
    private String phone;

    public OperatoresPhones() {
    }

    public OperatoresPhones(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
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
        if (!(object instanceof OperatoresPhones)) {
            return false;
        }
        OperatoresPhones other = (OperatoresPhones) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.OperatoresPhones[ id=" + id + " ]";
    }
    
}
