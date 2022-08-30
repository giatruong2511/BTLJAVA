/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.Buses;
import com.btl.pojo.Route;
import com.btl.service.BusesService;
import com.btl.service.RouteService;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author DELL
 */
@Controller
@ControllerAdvice
public class BusesAdminComtroller {
    @Autowired
    private RouteService routeService;
    @Autowired
    private BusesService busesService;
    @GetMapping("admin/addbuses")
    public String addbuses(Model model) {
        model.addAttribute("buses", new Buses());
        model.addAttribute("route", this.routeService.getRouteByBushomeId(1));
        model.addAttribute("car", this.busesService.getCarByBusHomeId(1));

        return "addbuses";
    }
    @GetMapping("admin/busesmanage")
    public String busesadmin(Model model) {
        
        model.addAttribute("buses", this.busesService.getBusesByBusHomeId(1));
        return "busesmanage";
    }
    @PostMapping("admin/addbuses")
    public String addbuses(Model model, @ModelAttribute(value = "buses") @Valid Buses buses, BindingResult r) {
        if (r.hasErrors()) {
            return "redirect:/";
        } 
        
        if (this.busesService.addBuses(buses) == true) {
             return "redirect:/admin/bushomeadmin";
        }
        model.addAttribute("errMsg", "He thong da xay ra loi! Vui long quay lai sau!");
        return "addbuses";
    }
    @GetMapping("admin/stats")
    public String stats(Model model) {
        model.addAttribute("countbuses", this.busesService.countBuses(1));
        model.addAttribute("countbusesbybushome", this.busesService.countBusesByBushomeId(1));
        model.addAttribute("countroute", this.routeService.countRoute(1));
        return "stats";
    }
}
