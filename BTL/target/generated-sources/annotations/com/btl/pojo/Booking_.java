package com.btl.pojo;

import com.btl.pojo.Buses;
import com.btl.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-02T20:56:19")
@StaticMetamodel(Booking.class)
public class Booking_ { 

    public static volatile SingularAttribute<Booking, Integer> numberticket;
    public static volatile SingularAttribute<Booking, Buses> busesId;
    public static volatile SingularAttribute<Booking, String> phone;
    public static volatile SingularAttribute<Booking, String> name;
    public static volatile SingularAttribute<Booking, Date> bookingDate;
    public static volatile SingularAttribute<Booking, Integer> id;
    public static volatile SingularAttribute<Booking, Long> totalmoney;
    public static volatile SingularAttribute<Booking, User> userId;
    public static volatile SingularAttribute<Booking, String> email;

}