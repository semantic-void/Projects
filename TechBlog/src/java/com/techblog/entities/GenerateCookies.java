package com.techblog.entities;

import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class GenerateCookies {

    private User user;

    public GenerateCookies(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    /**
     * About can not go with cookies because the max length of cookie is one
     * word. More then that will be ignored by cookies. list.add(new
     * Cookie("about", user.getAbout()));
     */
    private ArrayList getCookies() {
        ArrayList<Cookie> list = new ArrayList<>();
        list.add(new Cookie("user_id", user.getUser_id()));
        list.add(new Cookie("user_name", user.getUser_name()));
        list.add(new Cookie("user_email", user.getE_mail()));
        list.add(new Cookie("gender", user.getGender()));
        return list;
    }

    public void setCookiesToSend(HttpServletResponse response) {
        ArrayList<Cookie> list = getCookies();
        Iterator<Cookie> it = list.iterator();
        while (it.hasNext()) {
            response.addCookie(it.next());
        }
    }
}
