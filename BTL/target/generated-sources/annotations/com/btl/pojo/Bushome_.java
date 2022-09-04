package com.btl.pojo;

import com.btl.pojo.Car;
import com.btl.pojo.Comment;
import com.btl.pojo.Route;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-02T20:56:19")
@StaticMetamodel(Bushome.class)
public class Bushome_ { 

    public static volatile SingularAttribute<Bushome, String> image;
    public static volatile SingularAttribute<Bushome, String> address;
    public static volatile SingularAttribute<Bushome, Date> createdDate;
    public static volatile SetAttribute<Bushome, Comment> commentSet;
    public static volatile SingularAttribute<Bushome, String> phone;
    public static volatile SetAttribute<Bushome, Car> carSet;
    public static volatile SingularAttribute<Bushome, String> name;
    public static volatile SingularAttribute<Bushome, Boolean> active;
    public static volatile SetAttribute<Bushome, Route> routeSet;
    public static volatile SingularAttribute<Bushome, Integer> id;
    public static volatile SingularAttribute<Bushome, String> email;

}