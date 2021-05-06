package com.dao;

import com.entity.Comment;
import com.entity.Post;
import com.entity.User;

import java.util.List;

interface UserDAO {
    List<User> getUserList();
    void userSignup(User user);
    void login(User user);
    void createPost();
    void deletePost(Post post);
    void editPost(Post post);
    void getPost(Post post);

    void createComment();
    void deleteComment(Comment comment);
    void editComment(Comment comment);
    void getComment(Comment comment);

    void getUser(User user);
}
