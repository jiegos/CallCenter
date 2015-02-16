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
@Table(name = "DIR_FILE_UPLOAD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DirFileUpload.findAll", query = "SELECT d FROM DirFileUpload d"),
    @NamedQuery(name = "DirFileUpload.findById", query = "SELECT d FROM DirFileUpload d WHERE d.id = :id"),
    @NamedQuery(name = "DirFileUpload.findByDirectory", query = "SELECT d FROM DirFileUpload d WHERE d.directory = :directory")})
public class DirFileUpload implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "DIRECTORY")
    private String directory;

    public DirFileUpload() {
    }

    public DirFileUpload(String id) {
        this.id = id;
    }

    public DirFileUpload(String id, String directory) {
        this.id = id;
        this.directory = directory;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDirectory() {
        return directory;
    }

    public void setDirectory(String directory) {
        this.directory = directory;
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
        if (!(object instanceof DirFileUpload)) {
            return false;
        }
        DirFileUpload other = (DirFileUpload) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.DirFileUpload[ id=" + id + " ]";
    }
    
}
