package com.entity;

import java.sql.Timestamp;

public class Comment {

    private int id;
    private int postID;
    private int userID;
    private String comment;
    private Timestamp date;

    public Comment(int id, int postID, int userID, String comment, Timestamp date) {
        this.id = id;
        this.postID = postID;
        this.userID = userID;
        this.comment = comment;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
