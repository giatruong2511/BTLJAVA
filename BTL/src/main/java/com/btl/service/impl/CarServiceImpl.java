/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service.impl;

import com.btl.pojo.Car;
import com.btl.repository.CarRepository;
import com.btl.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class CarServiceImpl implements CarService{
    @Autowired
    private CarRepository carRepository;
    @Override
    public boolean addCar(Car car) {
        return this.carRepository.addCar(car);
    }
    
}
