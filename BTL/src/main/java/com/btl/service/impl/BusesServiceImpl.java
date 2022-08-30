/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service.impl;

import com.btl.pojo.Buses;
import com.btl.pojo.Car;
import com.btl.repository.BusesRepository;
import com.btl.service.BusesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class BusesServiceImpl implements BusesService{
    
    @Autowired
    private BusesRepository busesRepository;
    
    @Override
    public List<Buses> getBusesByRouteId(int id) {
        return this.busesRepository.getBusesByRouteId(id);
    }

    @Override
    public List<Car> getCarByBusHomeId(int id) {
        return this.busesRepository.getCarByBusHomeId(id);
    }

    @Override
    public List<Buses> getBusesByBusHomeId(int id) {
        return this.busesRepository.getBusesByBusHomeId(id);
    }

    @Override
    public boolean addBuses(Buses buses) {
        
        return this.busesRepository.addBuses(buses);
    }

    @Override
    public List<Object> countBuses(int id) {
        return this.busesRepository.countBuses(id);
    }

    @Override
    public long countBusesByBushomeId(int id) {
        return this.busesRepository.countBusesByBushomeId(id);
    }

    @Override
    public Buses getBusesById(int id) {
        return this.busesRepository.getBusesById(id);
    }
    
}
