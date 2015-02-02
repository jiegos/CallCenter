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
import ua.divas.model.entity.Users;

/**
 *
 * @author igor
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "CallCenterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
    public List<Users> findIdByLogin(String login){
       return em.createNamedQuery("Users.findIdByLogin").setParameter("login", login).getResultList();
        
    }
    
     public List<Users> findByLogin(String login){
       return em.createNamedQuery("Users.findByLogin").setParameter("login", login).getResultList();
        
    }
    
    public List<Users> findLogins() {
        return em.createNamedQuery("Users.findLogins").getResultList();
    }

    public List<Users> findPassWdByLogin(String login) {
        return em.createNamedQuery("Users.findPassWdByLogin").setParameter("login", login).getResultList();
    }

    public boolean logincheck(String login, String passWd) {

        try {
            Users u = em.createNamedQuery("Users.findByLoginAndPassWd", Users.class).setParameter("login", login).setParameter("passWd", passWd).getSingleResult();
            if(u != null){
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }

    }
}
