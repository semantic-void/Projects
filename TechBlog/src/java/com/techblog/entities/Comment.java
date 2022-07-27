package com.techblog.entities;

import java.sql.Timestamp;

public class Comment {

    private String comment_id, pid, user_id;
    private String comment;
    private String username;//optional
    private Timestamp timestamp;

    public Comment() {
    }
    
    public Comment(String comment_id, String pid, String user_id, String comment, Timestamp timestamp) {
        this.comment_id = comment_id;
        this.pid = pid;
        this.user_id = user_id;
        this.comment = comment;
        this.timestamp = timestamp;
    }

    public Comment(String username, String comment, Timestamp timestamp) {
        this.username = username;
        this.comment = comment;
        this.timestamp = timestamp;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "Comment{" + "comment_id=" + comment_id + ", pid=" + pid
                + ", user_id=" + user_id + ", comment=" + comment + ", timestamp=" + timestamp + '}';
    }

}
