/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.formatter;

import com.btl.pojo.Car;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author DELL
 */
public class CarFormatter implements  Formatter<Car>{

    @Override
    public String print(Car t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Car parse(String id, Locale locale) throws ParseException {
        Car  c = new Car();
        c.setId(Integer.parseInt(id));

        return c;
    }
    
}
