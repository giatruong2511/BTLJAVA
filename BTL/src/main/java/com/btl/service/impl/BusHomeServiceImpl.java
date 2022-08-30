/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service.impl;

import com.btl.pojo.Bushome;
import com.btl.repository.BusHomeRepository;
import com.btl.service.BusHomeService;
import com.cloudinary.Cloudinary;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class BusHomeServiceImpl implements BusHomeService{
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private BusHomeRepository busHomeRepository;
    
    @Override
    public List<Bushome> getBusHome(Map<String, String> params, int page) {
        return this.busHomeRepository.getBusHome(params, page);
    }

    @Override
    public boolean addBusHome(Bushome bushome) {
         return this.busHomeRepository.addBusHome(bushome);
    }

    @Override
    public boolean deleteBusHome(int id) {
        return this.busHomeRepository.deleteBusHome(id);
    }

    @Override
    public boolean updateBusHome(int id) {
        return this.busHomeRepository.updateBusHome(id);
    }

    @Override
    public List<Bushome> getBusHomeFalse() {
        return this.busHomeRepository.getBusHomeFalse();
    }

    @Override
    public long countBusHome() {
       return this.busHomeRepository.countBusHome();
    }

    @Override
    public Bushome getBushomeById(int id) {
        return this.busHomeRepository.getBushomeById(id);
    }

  
}
