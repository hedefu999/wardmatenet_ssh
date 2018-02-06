package com.dao;

import com.entity.PatientsUser;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by hedefu on 29/09/2017.
 */
public class PatientsUserDao extends BaseDao {
    @Transactional
    public Integer save(PatientsUser user){
        return (Integer) getSession().save(user);
    }
    @Transactional
    public void saveOrUpdate(PatientsUser user){
        getSession().saveOrUpdate(user);
    }

    public boolean checkUser(PatientsUser user){
        //hibernate自动将表名大写了
        String hql="FROM PatientsUser p WHERE p.userName = ?1 AND p.userPass = ?2";
        Query query = getSession().createQuery(hql).setParameter(1,user.getUserName()).setParameter(2,user.getUserPass());
        PatientsUser user1 = (PatientsUser) query.uniqueResult();
        if (user1 != null){
            return true;
        }else {
            return false;
        }
    }
    public PatientsUser getUserByName(String name){
        String hql="FROM PatientsUser p WHERE p.userName = ?1";
        Query query = getSession().createQuery(hql).setParameter(1,name);
        PatientsUser user = (PatientsUser) query.uniqueResult();
        return user;
    }

}
