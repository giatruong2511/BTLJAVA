/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.Route;
import com.btl.service.RouteService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DELL
 */
@Controller
@ControllerAdvice
public class RouteAdminController {
    @Autowired
    private RouteService routeService;
    
    @GetMapping("admin/1/routeadmin")
    public String route(Model model) {
       Integer a = 1;
       model.addAttribute(a);
       model.addAttribute("route", new Route());
        return "routeadmin";
    }
    @PostMapping("admin/1/routeadmin")
    public String add(Model model, @ModelAttribute(value = "route") @Valid Route route, BindingResult r) {
        if (r.hasErrors()) {
            return "redirect:/";
        }
       
        if (this.routeService.addRoute(route) == true) {
             return "routeadmin";
        }
        model.addAttribute("errMsg", "He thong da xay ra loi! Vui long quay lai sau!");
        return "routeadmin";
    }
}

