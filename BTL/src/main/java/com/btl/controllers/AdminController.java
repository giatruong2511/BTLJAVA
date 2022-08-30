/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.Bushome;
import com.btl.service.BusHomeService;
import com.btl.service.RouteService;
import com.btl.service.UserService;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author DELL
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class AdminController {

    @Autowired
    private BusHomeService busHomeService;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private Environment env;

    @Autowired
    private UserService userService;

    @RequestMapping("admin/bushomeadmin/addbushome")
    public String add(Model model) {
        model.addAttribute("bushome", new Bushome());
        return "addbushome";
    }

    @RequestMapping("admin/bushomeadmin")
    public String index(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("bushome", this.busHomeService.getBusHome(params, page));
        model.addAttribute("counter", this.busHomeService.countBusHome());
        model.addAttribute("counterUser", this.userService.countUser());
        model.addAttribute("pageSize", Integer.parseInt(env.getProperty("page.size")));
        return "bushomeadmin";
    }

    @RequestMapping("admin/bushomeadmin/listbushome")
    public String listbushome(Model model) {
        return "listbushome";
    }

    @RequestMapping("admin/bushomeadmin/listbushomefalse")
    public String listbushomefalse(Model model) {
        return "listbushomefalse";
    }

    @PostMapping("admin/bushome")
    public String add(Model model, @ModelAttribute(value = "bushome") @Valid Bushome bushome, BindingResult r) {
        if (r.hasErrors()) {
            return "addbushome";
        }
        if (bushome.getFile() != null) {
            try {
                bushome.setCreatedDate(new Date());
                bushome.setActive(Boolean.FALSE);
                Map res = this.cloudinary.uploader().upload(bushome.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                bushome.setImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(IndexController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (this.busHomeService.addBusHome(bushome) == true) {
            return "redirect:/admin/bushomeadmin/listbushomefalse";
        }
        model.addAttribute("errMsg", "He thong da xay ra loi! Vui long quay lai sau!");
        return "addbushome";
    }
}
