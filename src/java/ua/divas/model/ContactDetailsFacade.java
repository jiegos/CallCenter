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
import ua.divas.model.entity.ContactDetails;
import ua.divas.model.entity.Kontragents;

/**
 *
 * @author igor
 */
@Stateless
public class ContactDetailsFacade extends AbstractFacade<ContactDetails> {
    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContactDetailsFacade() {
        super(ContactDetails.class);
    }
    
     public List<ContactDetails> findByKontragentId(Kontragents kontragId){
        return em.createNamedQuery("ContactDetails.findByKontragentId").setParameter("kontragId", kontragId).getResultList();     
    }   
       
      public List<String>  findPhones(Kontragents kontragId){
        return em.createNamedQuery("ContactDetails.findPhones").setParameter("kontragId", kontragId).getResultList();     
    }
}
