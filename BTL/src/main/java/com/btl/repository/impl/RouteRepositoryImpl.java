/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.repository.impl;

import com.btl.pojo.Bushome;
import com.btl.pojo.Route;
import com.btl.repository.RouteRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
public class RouteRepositoryImpl implements RouteRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Route> getRoute(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Route> q = b.createQuery(Route.class);
        Root root = q.from(Route.class);
        q.select(root);
//        if (params != null) {
//            List<Predicate> predicates = new ArrayList<>();
//            String from = params.get("from");
//            if (from != null && !from.isEmpty()) {
//                Predicate p = b.like(root.get("startingPOS").as(String.class),
//                        String.format("%%%s%%", from));
//                predicates.add(p);
//            }
//            String end = params.get("end");
//            if (end != null && !end.isEmpty()) {
//                Predicate p = b.like(root.get("endPOS").as(String.class),
//                        String.format("%%%s%%", end));
//                predicates.add(p);
//            }
//            
//            q.where(predicates.toArray(new Predicate[]{}));
//
//        }
        q.orderBy(b.desc(root.get("id")), b.desc(root.get("startingPOS")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Route> getRouteByBushomeId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Route> q = b.createQuery(Route.class);
        Root root = q.from(Route.class);

        q.where(b.equal(root.get("bushomeId"), id));
        q.orderBy(b.desc(root.get("id")));
        
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addRoute(Route route) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            route.setBushomeId(session.get(Bushome.class, 1));
            route.setActive(Boolean.TRUE);
            session.save(route);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteRoute(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            Route bh = session.get(Route.class, id);
            session.delete(bh);
            
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public long countRoute(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        String sql = "Select Count(id) From Route r where r.bushomeId.id=:id";
        Query query = session.createQuery(sql);
        query.setParameter("id", id);
        return (long) query.getSingleResult();
    }

    @Override
    public Route getRouteById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        return session.get(Route.class, id);
    }


}
