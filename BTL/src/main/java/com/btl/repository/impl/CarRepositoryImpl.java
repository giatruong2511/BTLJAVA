/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.repository.impl;

import com.btl.pojo.Bushome;
import com.btl.pojo.Car;
import com.btl.repository.CarRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author DELL
 */
@Repository
@Transactional
public class CarRepositoryImpl implements CarRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public boolean addCar(Car car) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            car.setBushomeId(session.get(Bushome.class, 1));
            car.setActive(Boolean.TRUE);
            session.save(car);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
