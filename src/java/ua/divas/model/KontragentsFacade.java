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
import ua.divas.model.entity.Kontragents;
import ua.divas.model.entity.Users;

/**
 *
 * @author igor
 */
@Stateless
public class KontragentsFacade extends AbstractFacade<Kontragents> {
    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public KontragentsFacade() {
        super(Kontragents.class);        
    }
    public Kontragents findById(String id){
        return (Kontragents) em.createNamedQuery("Kontragents.findById").setParameter("id", id).getSingleResult();
    }
    public List<Kontragents> findByUserId(Users userId){
        return  em.createNamedQuery("Kontragents.findByUserId").setParameter("userId", userId).getResultList();
    }
    
    public List<Kontragents> findByFullname(String fullname){
        return  em.createNamedQuery("Kontragents.findByFullname").setParameter("fullname", fullname).getResultList();
    }
}
