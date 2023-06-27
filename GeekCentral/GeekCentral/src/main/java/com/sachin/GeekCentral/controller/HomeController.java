package com.sachin.GeekCentral.controller;

import com.sachin.GeekCentral.entity.Category;
import com.sachin.GeekCentral.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpRequest;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private CategoryRepository categoryRepo;
    @GetMapping("/")
    public String showIndexPage() {
        return "index";
    }

    @GetMapping("/login")
    public String getLogin() {
        return "login";
    }

    @GetMapping("/signup")
    public String getSignupPage() {
        return "signup";
    }

    @GetMapping("/main")
    public String getMainPage(Model model) {
        List<Category> categories = categoryRepo.findAll();
        model.addAttribute("categories",categories);
        return "secured/main";
    }

//    @RequestMapping("/access_denied")
//    public String getErrorPage() {
//        return "error/error";
//    }

}
