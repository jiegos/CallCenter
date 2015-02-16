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
@Table(name = "QUARTZ_PROPERTY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "QuartzProperty.findAll", query = "SELECT q FROM QuartzProperty q"),
    @NamedQuery(name = "QuartzProperty.findById", query = "SELECT q FROM QuartzProperty q WHERE q.id = :id"),
    @NamedQuery(name = "QuartzProperty.findByInstanceName", query = "SELECT q FROM QuartzProperty q WHERE q.instanceName = :instanceName"),
    @NamedQuery(name = "QuartzProperty.findByThreadpoolClass", query = "SELECT q FROM QuartzProperty q WHERE q.threadpoolClass = :threadpoolClass"),
    @NamedQuery(name = "QuartzProperty.findByThreadCount", query = "SELECT q FROM QuartzProperty q WHERE q.threadCount = :threadCount"),
    @NamedQuery(name = "QuartzProperty.findByThreadsContext", query = "SELECT q FROM QuartzProperty q WHERE q.threadsContext = :threadsContext"),
    @NamedQuery(name = "QuartzProperty.findByJobstoreClass", query = "SELECT q FROM QuartzProperty q WHERE q.jobstoreClass = :jobstoreClass"),
    @NamedQuery(name = "QuartzProperty.findByDriverDelegate", query = "SELECT q FROM QuartzProperty q WHERE q.driverDelegate = :driverDelegate"),
    @NamedQuery(name = "QuartzProperty.findByTablePrefix", query = "SELECT q FROM QuartzProperty q WHERE q.tablePrefix = :tablePrefix"),
    @NamedQuery(name = "QuartzProperty.findByDataSource", query = "SELECT q FROM QuartzProperty q WHERE q.dataSource = :dataSource"),
    @NamedQuery(name = "QuartzProperty.findByDriver", query = "SELECT q FROM QuartzProperty q WHERE q.driver = :driver"),
    @NamedQuery(name = "QuartzProperty.findByUrl", query = "SELECT q FROM QuartzProperty q WHERE q.url = :url"),
    @NamedQuery(name = "QuartzProperty.findByUsr", query = "SELECT q FROM QuartzProperty q WHERE q.usr = :usr"),
    @NamedQuery(name = "QuartzProperty.findByPassword", query = "SELECT q FROM QuartzProperty q WHERE q.password = :password"),
    @NamedQuery(name = "QuartzProperty.findByMaxConnections", query = "SELECT q FROM QuartzProperty q WHERE q.maxConnections = :maxConnections")})
public class QuartzProperty implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ID")
    private String id;
    @Size(max = 60)
    @Column(name = "INSTANCE_NAME")
    private String instanceName;
    @Size(max = 50)
    @Column(name = "THREADPOOL_CLASS")
    private String threadpoolClass;
    @Size(max = 60)
    @Column(name = "THREAD_COUNT")
    private String threadCount;
    @Size(max = 60)
    @Column(name = "THREADS_CONTEXT")
    private String threadsContext;
    @Size(max = 60)
    @Column(name = "JOBSTORE_CLASS")
    private String jobstoreClass;
    @Size(max = 60)
    @Column(name = "DRIVER_DELEGATE")
    private String driverDelegate;
    @Size(max = 60)
    @Column(name = "TABLE_PREFIX")
    private String tablePrefix;
    @Size(max = 60)
    @Column(name = "DATA_SOURCE")
    private String dataSource;
    @Size(max = 60)
    @Column(name = "DRIVER")
    private String driver;
    @Size(max = 60)
    @Column(name = "URL")
    private String url;
    @Size(max = 50)
    @Column(name = "USR")
    private String usr;
    @Size(max = 50)
    @Column(name = "PASSWORD")
    private String password;
    @Size(max = 50)
    @Column(name = "MAX_CONNECTIONS")
    private String maxConnections;

    public QuartzProperty() {
    }

    public QuartzProperty(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInstanceName() {
        return instanceName;
    }

    public void setInstanceName(String instanceName) {
        this.instanceName = instanceName;
    }

    public String getThreadpoolClass() {
        return threadpoolClass;
    }

    public void setThreadpoolClass(String threadpoolClass) {
        this.threadpoolClass = threadpoolClass;
    }

    public String getThreadCount() {
        return threadCount;
    }

    public void setThreadCount(String threadCount) {
        this.threadCount = threadCount;
    }

    public String getThreadsContext() {
        return threadsContext;
    }

    public void setThreadsContext(String threadsContext) {
        this.threadsContext = threadsContext;
    }

    public String getJobstoreClass() {
        return jobstoreClass;
    }

    public void setJobstoreClass(String jobstoreClass) {
        this.jobstoreClass = jobstoreClass;
    }

    public String getDriverDelegate() {
        return driverDelegate;
    }

    public void setDriverDelegate(String driverDelegate) {
        this.driverDelegate = driverDelegate;
    }

    public String getTablePrefix() {
        return tablePrefix;
    }

    public void setTablePrefix(String tablePrefix) {
        this.tablePrefix = tablePrefix;
    }

    public String getDataSource() {
        return dataSource;
    }

    public void setDataSource(String dataSource) {
        this.dataSource = dataSource;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMaxConnections() {
        return maxConnections;
    }

    public void setMaxConnections(String maxConnections) {
        this.maxConnections = maxConnections;
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
        if (!(object instanceof QuartzProperty)) {
            return false;
        }
        QuartzProperty other = (QuartzProperty) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.divas.model.entity.QuartzProperty[ id=" + id + " ]";
    }
    
}
