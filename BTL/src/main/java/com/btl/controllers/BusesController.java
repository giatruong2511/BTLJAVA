/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.service.BusesService;
import com.btl.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author DELL
 */
@Controller
public class BusesController {
    @Autowired
    private BusesService busesService;
    @Autowired
    private RouteService routeService;
    
    @RequestMapping("/route/{routeId}")
    public String getBuses(Model model, @PathVariable(name = "routeId") int id) {
        model.addAttribute("route", this.routeService.getRouteById(id));
        model.addAttribute("buses", this.busesService.getBusesByRouteId(id));
        return "buses";
    }
}
