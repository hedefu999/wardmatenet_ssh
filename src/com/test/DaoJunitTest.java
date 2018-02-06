package com.test;

import com.dao.PatientsUserDao;
import com.entity.PatientsUser;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;
import org.junit.Test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hedefu on 01/10/2017.
 */
public class DaoJunitTest {
    private PatientsUserDao userDao = new PatientsUserDao();
    @Test
    public void save() throws ParseException {
        ServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure("com/entity/hibernate.cfg.xml").build();
        SessionFactory factory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();

        PatientsUser user = new PatientsUser();
        user.setUserName("dsfdtn,k");
        user.setUserPass("ioulj");
        user.setEmail("xcbdfg@163.com");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdate = dateFormat.parse("1834-06-07");
        user.setBirthdate(new java.sql.Date(birthdate.getTime()));
        user.setRegdate(new java.sql.Date(new Date().getTime()));
        user.setDiseaseList("ti,vcn87");
        user.setPhoneNum("79464246543");
        System.out.println(user);
        Integer userId = (Integer) session.save(user);
        System.out.println(userId);
        transaction.commit();
        session.close();
        factory.close();
    }
}
