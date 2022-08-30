/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.Bushome;
import com.btl.pojo.Route;
import com.btl.service.BusHomeService;
import com.btl.service.RouteService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author DELL
 */
@RestController
@RequestMapping("/api")
@PropertySource("classpath:messages.properties")
public class ApiBusHomeController {
    @Autowired
    private BusHomeService busHomeService;
    @Autowired
    private RouteService routeService;
    @GetMapping("/bushome")
    public ResponseEntity<List<Bushome>> getBusHome(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.busHomeService.getBusHome(null, 0), HttpStatus.OK);
    }
    @GetMapping("/bushomes")
    public ResponseEntity<List<Bushome>> getBusHomeFalse() {
        return new ResponseEntity<>(this.busHomeService.getBusHomeFalse(), HttpStatus.OK);
    }
    @GetMapping("/bushome/{bushomeId}/route")
    public ResponseEntity<List<Route>> getRoute(@PathVariable(value = "bushomeId") int id) {
        return new ResponseEntity<>(this.routeService.getRouteByBushomeId(id), HttpStatus.OK);
    }
    @DeleteMapping("/bushome/{bushomeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "bushomeId") int id){
        this.busHomeService.deleteBusHome(id);
    }
    @PutMapping("/bushome/{bushomeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void update(@PathVariable(value = "bushomeId") int id){
        this.busHomeService.updateBusHome(id);
    }
    @PutMapping("/bushomes/{bushomeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updatefalse(@PathVariable(value = "bushomeId") int id){
        this.busHomeService.updateBusHome(id);
    }
}   
