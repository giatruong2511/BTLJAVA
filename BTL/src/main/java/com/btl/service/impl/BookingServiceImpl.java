/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service.impl;

import com.btl.pojo.Booking;
import com.btl.repository.BookingRepository;
import com.btl.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class BookingServiceImpl implements BookingService{
    @Autowired
    private BookingRepository bookingRepository;
    
    @Override
    public Booking addBooking(int numberticket, int busesid, long totalmoney, String name, String phone, String email) {
        return this.bookingRepository.addBooking(numberticket, busesid, totalmoney, name, phone, email);
    }
    
}
