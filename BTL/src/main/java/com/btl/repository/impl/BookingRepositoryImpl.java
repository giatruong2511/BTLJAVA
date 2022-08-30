/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.repository.impl;

import com.btl.pojo.Booking;
import com.btl.pojo.Buses;
import com.btl.pojo.User;
import com.btl.repository.BookingRepository;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author DELL
 */
@Repository
@Transactional 
public class BookingRepositoryImpl implements BookingRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    @Autowired
    private HttpSession sessions;
    
    @Override
    public Booking addBooking(int numberticket, int busesid, long totalmoney, String name, String phone, String email) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        User user  = (User) sessions.getAttribute("currentUser");
        Booking b = new Booking();
        b.setNumberticket(numberticket);
        b.setTotalmoney(totalmoney);
        b.setBusesId(session.get(Buses.class, busesid));
        b.setUserId(session.get(User.class, 1));
        b.setName(name);
        b.setPhone(phone);
        b.setEmail(email);
        session.save(b);

        return b;
    }
    
}
