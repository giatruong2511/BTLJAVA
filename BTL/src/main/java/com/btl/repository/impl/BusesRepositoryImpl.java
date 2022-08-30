/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.repository.impl;

import com.btl.pojo.Buses;
import com.btl.pojo.Bushome;
import com.btl.pojo.Car;
import com.btl.pojo.Route;
import com.btl.repository.BusesRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author DELL
 */
@Repository
@Transactional
public class BusesRepositoryImpl implements BusesRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Buses> getBusesByRouteId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Buses> q = b.createQuery(Buses.class);
        Root root = q.from(Buses.class);

        q.where(b.equal(root.get("routeId"), id));
        q.orderBy(b.desc(root.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Car> getCarByBusHomeId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Car> q = b.createQuery(Car.class);
        Root root = q.from(Car.class);

        q.where(b.equal(root.get("bushomeId"), id));
        q.orderBy(b.desc(root.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Buses> getBusesByBusHomeId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Buses> q = b.createQuery(Buses.class);

        Root root = q.from(Buses.class);
        q.where(b.equal(root.get("routeId").get("bushomeId"), id));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addBuses(Buses buses) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {

            session.save(buses);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Object> countBuses(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rR = q.from(Route.class);
        Root rB = q.from(Buses.class);

        q.where(b.and(b.equal(rR.get("bushomeId"), id),
                b.equal(rB.get("routeId"), rR.get("id"))));
        q.multiselect(rR.get("id"), rR.get("name"), b.count(rB.get("id")));
        q.groupBy(rR.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public long countBusesByBushomeId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String sql = "Select Count(id) From Buses r where r.routeId.bushomeId.id=:id";
        Query query = session.createQuery(sql);
        query.setParameter("id", id);
        return (long) query.getSingleResult();
    }

    @Override
    public Buses getBusesById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        return session.get(Buses.class, id);
    }

}
