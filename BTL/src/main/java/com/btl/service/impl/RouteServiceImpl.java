/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service.impl;

import com.btl.pojo.Route;
import com.btl.repository.RouteRepository;
import com.btl.service.RouteService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class RouteServiceImpl implements RouteService{
    
    @Autowired
    private RouteRepository routeRepository;
    
    @Override
    public List<Route> getRoute(Map<String, String> params) {
        return this.routeRepository.getRoute(params);
    }

    @Override
    public List<Route> getRouteByBushomeId(int id) {
        return this.routeRepository.getRouteByBushomeId(id);
    }

    @Override
    public boolean addRoute(Route route) {
        return this.routeRepository.addRoute(route);
    }

    @Override
    public boolean deleteRoute(int id) {
        return this.routeRepository.deleteRoute(id);
    }

    @Override
    public long countRoute(int id) {
        return this.routeRepository.countRoute(id);
    }

    @Override
    public Route getRouteById(int id) {
        return this.routeRepository.getRouteById(id);
    }

    
}
