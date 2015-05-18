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
import ua.divas.model.entity.CallLog;
import ua.divas.model.entity.ContactDetails;

/**
 *
 * @author igor
 */
@Stateless
public class CallLogFacade extends AbstractFacade<CallLog> {
    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CallLogFacade() {
        super(CallLog.class);
    }
    
    public List<CallLog> findByContact_Id(ContactDetails contactId){
        return em.createNamedQuery("CallLog.findByContact_Id").setParameter("contactId", contactId).getResultList();       
    }
}
