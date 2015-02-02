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
import ua.divas.model.entity.CallLists;

/**
 *
 * @author igor
 */
@Stateless
public class CallListsFacade extends AbstractFacade<CallLists> {
    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CallListsFacade() {
        super(CallLists.class);
    }
    
    
    public List<CallLists> findByUsersId(String usersId){
        return em.createNamedQuery("CallLists.findByUsersId").setParameter("usersId", usersId).getResultList();       
    }
    
    public List<CallLists> findByUsersIdAndListName(String usersId, String listName){
        return em.createNamedQuery("CallLists.findByUsersIdAndListName").setParameter("usersId", usersId).setParameter("listName", listName).getResultList();       
    }
}
