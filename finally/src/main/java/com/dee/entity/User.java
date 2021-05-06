package com.dee.entity;

import java.sql.Timestamp;

public class User {
    private int user_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String birthdate;
    private String gender;
    private Timestamp dateOpened;

    public User(String firstame, String lastname, String email, String password, String birthdate, String gender) {
        this.firstname = firstame;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.birthdate = birthdate;
        this.gender = gender;
    }

    public User(int user_id, String firstame, String lastname, String email, String password, String birthdate, String gender) {
        this.user_id = user_id;
        this.firstname = firstame;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.birthdate = birthdate;
        this.gender = gender;
        this.dateOpened = dateOpened;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateOpened() {
        return dateOpened;
    }

    public void setDateOpened(Timestamp dateOpened) {
        this.dateOpened = dateOpened;
    }
}
