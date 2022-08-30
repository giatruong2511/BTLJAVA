/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;


import com.btl.pojo.Car;
import com.btl.service.CarService;
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
public class CarController {
    @Autowired
    private CarService carService;
    @GetMapping("admin/addcar")
    public String addcar(Model model) {
        model.addAttribute("car", new Car());
        return "addcar";
    }
    
    @PostMapping("admin/addcar")
    public String addbuses(Model model, @ModelAttribute(value = "car") @Valid Car car, BindingResult r) {
        if (r.hasErrors()) {
            return "redirect:/";
        } 
        
        if (this.carService.addCar(car) == true) {
             return "redirect:/admin/bushomeadmin";
        }
        model.addAttribute("errMsg", "He thong da xay ra loi! Vui long quay lai sau!");
        return "addbuses";
    }
}
