/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service;

import com.btl.pojo.Buses;
import com.btl.pojo.Car;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface BusesService {
    List<Buses> getBusesByBusHomeId(int id);
    List<Buses> getBusesByRouteId(int id);
    List<Car> getCarByBusHomeId(int id);
    boolean addBuses(Buses buses);
    List<Object> countBuses(int id);
    long countBusesByBushomeId(int id);
    Buses getBusesById(int id);
}
