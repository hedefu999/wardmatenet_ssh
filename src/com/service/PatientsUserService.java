package com.service;

import com.dao.PatientsUserDao;
import com.entity.PatientsUser;

/**
 * Created by hedefu on 29/09/2017.
 */
public class PatientsUserService {
    private PatientsUserDao userDao;

    public void setUserDao(PatientsUserDao userDao) {
        this.userDao = userDao;
    }

    public void saveOrUpdate(PatientsUser user){
        userDao.saveOrUpdate(user);
    }

    public Integer save(PatientsUser user){
        return userDao.save(user);
    }

    public boolean checkUserExist(PatientsUser user){
        return userDao.checkUser(user);
    }

    public PatientsUser getUserByName(String userName){
        return userDao.getUserByName(userName);
    }
    public PatientsUser getUserById(Integer userId){
        return null;
    }
}
