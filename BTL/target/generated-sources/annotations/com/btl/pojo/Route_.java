package com.btl.pojo;

import com.btl.pojo.Buses;
import com.btl.pojo.Bushome;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-02T20:56:19")
@StaticMetamodel(Route.class)
public class Route_ { 

    public static volatile SingularAttribute<Route, String> startingPOS;
    public static volatile SingularAttribute<Route, Bushome> bushomeId;
    public static volatile SingularAttribute<Route, String> name;
    public static volatile SingularAttribute<Route, Boolean> active;
    public static volatile SetAttribute<Route, Buses> busesSet;
    public static volatile SingularAttribute<Route, Integer> id;
    public static volatile SingularAttribute<Route, String> endPOS;

}