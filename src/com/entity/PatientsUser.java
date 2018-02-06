package com.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by hedefu on 01/10/2017.
 */
@Entity
public class PatientsUser {
    private int userId;
    private String userName;
    private String userPass;
    private String email;
    private Date regdate;
    private Date birthdate;
    private String phoneNum="";
    private String diseaseList;
    private String gender;

    @Id
    @Column(name = "userId", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "userName", nullable = false, length = 20)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "userPass", nullable = false, length = 20)
    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 20)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "regdate", nullable = true)
    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    @Basic
    @Column(name = "birthdate", nullable = true)
    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    @Basic
    @Column(name = "phoneNum", nullable = true, length = 11)
    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    @Basic
    @Column(name = "diseaseList", nullable = true, length = 40)
    public String getDiseaseList() {
        return diseaseList;
    }

    public void setDiseaseList(String diseaseList) {
        this.diseaseList = diseaseList;
    }

    @Basic
    @Column(name = "gender", nullable = false)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PatientsUser user = (PatientsUser) o;

        if (userId != user.userId) return false;
        if (userName != null ? !userName.equals(user.userName) : user.userName != null) return false;
        if (userPass != null ? !userPass.equals(user.userPass) : user.userPass != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (regdate != null ? !regdate.equals(user.regdate) : user.regdate != null) return false;
        if (birthdate != null ? !birthdate.equals(user.birthdate) : user.birthdate != null) return false;
        if (phoneNum != null ? !phoneNum.equals(user.phoneNum) : user.phoneNum != null) return false;
        if (diseaseList != null ? !diseaseList.equals(user.diseaseList) : user.diseaseList != null) return false;
        if (gender != null ? !gender.equals(user.gender) : user.gender != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userPass != null ? userPass.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (regdate != null ? regdate.hashCode() : 0);
        result = 31 * result + (birthdate != null ? birthdate.hashCode() : 0);
        result = 31 * result + (phoneNum != null ? phoneNum.hashCode() : 0);
        result = 31 * result + (diseaseList != null ? diseaseList.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "PatientsUser{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPass='" + userPass + '\'' +
                ", email='" + email + '\'' +
                ", regdate=" + regdate +
                ", birthdate=" + birthdate +
                ", phoneNum='" + phoneNum + '\'' +
                ", diseaseList='" + diseaseList + '\'' +
                ", gender='" + gender + '\'' +
                '}';
    }
}
