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
import ua.divas.model.entity.Cdr3cx;
import ua.divas.model.entity.Kontragents;

/**
 *
 * @author igor
 */
@Stateless
public class Cdr3cxFacade extends AbstractFacade<Cdr3cx> {
    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Cdr3cxFacade() {
        super(Cdr3cx.class);
    }
    
    public List<Cdr3cx> findByUserId(String userId){
        return em.createNamedQuery("Cdr3cx.findByUserId").setParameter("userId", userId).getResultList();       
    }
     public List<Cdr3cx> findByKontragentId(String kontragentId){
        return em.createNamedQuery("Cdr3cx.findByKontragentId").setParameter("kontragentId", kontragentId).getResultList();       
    }
}
