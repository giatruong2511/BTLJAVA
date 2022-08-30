/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.formatter;

import com.btl.pojo.Bushome;
import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

/**
 *
 * @author DELL
 */
public class BusHomeFormatter implements  Formatter<Bushome>{

    @Override
    public String print(Bushome t, Locale locale) {
         return String.valueOf(t.getId());
    }

    @Override
    public Bushome parse(String id, Locale locale) throws ParseException {
        Bushome bh = new Bushome();
        
        bh.setId(Integer.parseInt(id));

        return bh;
    }
    
}
