package com.btl.pojo;

import com.btl.pojo.Booking;
import com.btl.pojo.Car;
import com.btl.pojo.Route;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-02T20:56:19")
@StaticMetamodel(Buses.class)
public class Buses_ { 

    public static volatile SingularAttribute<Buses, Integer> delivery;
    public static volatile SingularAttribute<Buses, String> hours;
    public static volatile SingularAttribute<Buses, Route> routeId;
    public static volatile SingularAttribute<Buses, Long> price;
    public static volatile SetAttribute<Buses, Booking> bookingSet;
    public static volatile SingularAttribute<Buses, Integer> id;
    public static volatile SingularAttribute<Buses, Date> time;
    public static volatile SingularAttribute<Buses, Car> carId;

}