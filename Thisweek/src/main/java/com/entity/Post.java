package com.entity;

public class Post {
    Comment comment;
    private int numOfLikes;

    Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public int getNumOfLikes() {
        return numOfLikes;
    }

    public void like() {
        this.numOfLikes += 1;
    }
    public void unLike() {
        this.numOfLikes -= 1;
    }
}
