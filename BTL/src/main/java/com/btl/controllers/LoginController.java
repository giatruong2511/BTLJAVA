/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.User;
import com.btl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author DELL
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userDetailsService;
    
    @GetMapping("/signin")
    public String login() {
        return "signin";
    }
    
    @GetMapping("/signup")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "signup";
    }
    
    @PostMapping("/signup")
    public String addUser(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = "";
        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userDetailsService.addUser(user))
                return "redirect:/signin";
            else
                errMsg = "He thong dang co loi! Vui long quay lai sau!";
        } else
            errMsg = "Mat khau KHONG khop!";
        
        
        model.addAttribute("errMsg", errMsg);
        return "signup";
    }
}
