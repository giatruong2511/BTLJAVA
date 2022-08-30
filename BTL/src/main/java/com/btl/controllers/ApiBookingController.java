/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.Booking;
import com.btl.pojo.Comment;
import com.btl.service.BookingService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author DELL
 */
@RestController
@RequestMapping("/api")
public class ApiBookingController {
    @Autowired
    private BookingService bookingService;
    
    @PostMapping(path = "/buses/{busesId}/booking", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Booking> addBooking(@RequestBody Map<String, String> params) {
        System.out.print(params.get("busesId"));
        System.out.print(params.get("numberticket"));
        System.out.print(params.get("totalmoney"));
        int busesid = Integer.parseInt(params.get("busesId"));
        int numberticket = Integer.parseInt(params.get("numberticket"));
        long totalmoney = Long.parseLong(params.get("totalmoney"));
        String name = params.get("name");
        String phone = params.get("phone");
        String email = params.get("email");
        Booking b = this.bookingService.addBooking(numberticket, busesid, totalmoney, name, phone, email);
        return new ResponseEntity<>(b, HttpStatus.CREATED);
    }
}
