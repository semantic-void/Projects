
package com.techblog.entities;

import java.sql.Timestamp;


public class Posts {

    private String cid, pid, title, content, relatedPic = "post_default.png", code, user_id;
    private Timestamp DateTime;

    /**
     * Whole Table accessible
     * @param cid
     * @param pid
     * @param user_id
     * @param title
     * @param content
     * @param code
     * @param profile_pic
     * @param DateTime 
     */
    public Posts(String cid, String pid, String user_id, String title, String content, String code, String profile_pic, Timestamp DateTime) {
        this.cid = cid;
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.relatedPic = profile_pic;
        this.DateTime = DateTime;
        this.user_id = user_id;
        this.code = code;
    }

    /**
     * Getter
     *
     * @param cid
     * @param pid
     * @param user_id
     * @param title
     * @param content
     * @param profile_pic
     * @param DateTime
     */
    public Posts(String cid, String pid, String user_id, String title, String content, String profile_pic, Timestamp DateTime) {
        this.cid = cid;
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.relatedPic = profile_pic;
        this.DateTime = DateTime;
        this.user_id = user_id;
    }

    /**
     * Setter
     *
     * @param cid
     * @param user_id
     * @param title
     * @param content
     * @param code
     * @param profile_pic
     */
    public Posts(String cid, String user_id, String title, String content, String code, String profile_pic) {
        this.cid = cid;
        this.title = title;
        this.content = content;
        this.relatedPic = profile_pic;
        this.code = code;
        this.user_id = user_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Posts() {
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRelatedPic() {
        return relatedPic;
    }

    public void setRelatedPic(String relatedPic) {
        this.relatedPic = relatedPic;
    }

    public Timestamp getDateTime() {
        return DateTime;
    }

    public void setDateTime(Timestamp DateTime) {
        this.DateTime = DateTime;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Posts{" + "cid=" + cid + ", pid=" + pid + ", title=" + title + ", content=" + content + ", profile_pic=" + relatedPic + ", code=" + code + ", user_id=" + user_id + ", DateTime=" + DateTime + '}';
    }

}
