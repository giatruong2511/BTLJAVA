/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;
import com.btl.service.BusesService;
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
public class BookingController {
    @Autowired
    private BusesService busesService;
    
    @RequestMapping("/buses/{busesId}/booking")
    public String getBooking(Model model, @PathVariable(name = "busesId") int id) {
        model.addAttribute("buses", this.busesService.getBusesById(id));
        return "booking";
    }
}