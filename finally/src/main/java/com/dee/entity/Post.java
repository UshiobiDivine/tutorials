package com.dee.entity;

import java.sql.Timestamp;

public class Post {

    private int postID;
    private int userID;
    private String deleted;
    private String body;
    private Timestamp date;
    private int numofLikes;

    // contructor
    public Post(int postID, int userID, String body, String deleted, Timestamp date, int totalLikes) {
        this.postID = postID;
        this.userID = userID;
        this.body = body;
        this.deleted = deleted;
        this.date = date;
        this.numofLikes = totalLikes;
    }

    // overloaded constructor
    public Post(int userID, String body) {
        this.userID = userID;
        this.body = body;
    }

    // overloaded constructor
    public Post(int postID, int userID, String body) {
        this.userID = userID;
        this.body = body;
        this.postID = postID;
    }

    public Post(String postID, String newMessage) {
        this.postID=Integer.parseInt(postID);
        this.body=newMessage;

    }


    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getNumofLikes() {
        return numofLikes;
    }

    public void setNumofLikes(int numofLikes) {
        this.numofLikes = numofLikes;
    }

}
