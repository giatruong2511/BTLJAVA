/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.User;
import com.btl.service.BusHomeService;

import com.btl.service.RouteService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DELL
 */

@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class IndexController {

    @Autowired
    private BusHomeService busHomeService;

    @Autowired
    private RouteService routeService;

    @Autowired
    private Environment env;

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("bushome", this.busHomeService.getBusHome(params, page));
        model.addAttribute("route", this.routeService.getRoute(params));
        model.addAttribute("counter", this.busHomeService.countBusHome());
        model.addAttribute("pageSize", Integer.parseInt(env.getProperty("page.size")));
        return "index";
    }
    
    @RequestMapping("/bushome/{bushomeId}")
    public String route(Model model, @PathVariable(name = "bushomeId") int id) {
        model.addAttribute("bushome", this.busHomeService.getBushomeById(id));
        model.addAttribute("route", this.routeService.getRouteByBushomeId(id));
        return "route";
    }
    
}
