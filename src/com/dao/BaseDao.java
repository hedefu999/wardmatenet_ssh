package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by hedefu on 29/09/2017.
 */
public class BaseDao {
    @Autowired
    private SessionFactory sessionFactory;
    private Session session;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        //这里getCurrentSession和openSession顺序不能调换，使用openSession导致每次开启新Session，事务配置将失效，最终导致savaOrUpdate等方法不提交，数据库无法插入数据
        try {
            session = sessionFactory.getCurrentSession();
        }catch (HibernateException e){
            e.printStackTrace();
            System.out.println("切换getSession方法中。。。");
            session = sessionFactory.openSession();
        }
        return session;
    }
}
