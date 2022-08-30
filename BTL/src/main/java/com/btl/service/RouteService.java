/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service;

import com.btl.pojo.Route;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public interface RouteService {
    List<Route> getRoute(Map<String, String> params);
    List<Route> getRouteByBushomeId(int id);
    boolean addRoute(Route route);
    boolean deleteRoute(int id);
    long countRoute(int id);
    Route getRouteById(int id);
}
