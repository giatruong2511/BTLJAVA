/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service;

import com.btl.pojo.Bushome;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public interface BusHomeService {
    List<Bushome> getBusHome(Map<String, String> params, int page);
    List<Bushome> getBusHomeFalse();
    Bushome getBushomeById(int id);
    long countBusHome();
    boolean addBusHome(Bushome bushome);
    boolean deleteBusHome(int id);
    boolean updateBusHome(int id);
}
