/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.divas.model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import ua.divas.model.entity.Notification;

/**
 *
 * @author igor
 */
@Stateless
public class NotificationFacade extends AbstractFacade<Notification> {
    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NotificationFacade() {
        super(Notification.class);
    }
    
    public List< Notification> findByUserId(String userId){
        
        em.getEntityManagerFactory().getCache().evictAll();
        return em.createNamedQuery("Notification.findByUserId").setParameter("userId", userId).getResultList();       
}
    
    public List<Notification> findByTrgName(String trgName){
        return em.createNamedQuery("Notification.findByTrgName").setParameter("trgName", trgName).getResultList();       
    }
    
    public Short findClientById(String id){
        return (Short) em.createNamedQuery("Notification.findClientById").setParameter("id", id).getSingleResult();       
    }
    
    public Short findServerById(String id){
        return (Short) em.createNamedQuery("Notification.findServerById").setParameter("id", id).getSingleResult();       
    }
    
}
