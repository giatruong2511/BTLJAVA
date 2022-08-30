/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service;

import com.btl.pojo.Booking;

/**
 *
 * @author DELL
 */
public interface BookingService {
    Booking addBooking(int numberticket, int busesid, long totalmoney, String name, String phone, String email);
}
