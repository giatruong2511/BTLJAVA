package com.btl.pojo;

import com.btl.pojo.Buses;
import com.btl.pojo.Bushome;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-02T20:56:19")
@StaticMetamodel(Car.class)
public class Car_ { 

    public static volatile SingularAttribute<Car, Bushome> bushomeId;
    public static volatile SingularAttribute<Car, Boolean> active;
    public static volatile SetAttribute<Car, Buses> busesSet;
    public static volatile SingularAttribute<Car, Integer> id;
    public static volatile SingularAttribute<Car, String> licenseplate;
    public static volatile SingularAttribute<Car, Integer> seats;

}