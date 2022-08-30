package com.btl.repository.impl;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import com.btl.pojo.Bushome;
import com.btl.pojo.Comment;
import com.btl.pojo.Route;
import com.btl.pojo.User;
import com.btl.repository.BusHomeRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
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
@PropertySource("classpath:messages.properties")
public class BusHomeRepositoryImpl implements BusHomeRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private Environment env;

    @Override
    public List<Bushome> getBusHome(Map<String, String> params, int page) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Bushome> q = b.createQuery(Bushome.class);
        Root root = q.from(Bushome.class);
        
        q.select(root);
        List<Predicate> predicates = new ArrayList<>();
        Predicate p = b.equal(root.get("active"), Boolean.TRUE);
        predicates.add(p);
        if (params != null) {
            Root r = q.from(Route.class);
            predicates.add(b.equal(r.get("bushomeId"), root.get("id")));
            String from = params.get("from");
            if (from != null && !from.isEmpty()) {
                Predicate f = b.like(r.get("startingPOS").as(String.class),
                        String.format("%%%s%%", from));
                predicates.add(f);
            }
            String end = params.get("end");
            if (end != null && !end.isEmpty()) {
                Predicate e = b.like(r.get("endPOS").as(String.class),
                        String.format("%%%s%%", end));
                predicates.add(e);
            }
        }
        q.where(predicates.toArray(new Predicate[]{}));

        Query query = session.createQuery(q);
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }
        return query.getResultList();
    }

    @Override
    public List<Bushome> getBusHomeFalse() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Bushome> q = b.createQuery(Bushome.class);
        Root root = q.from(Bushome.class);
        q.select(root);
        List<Predicate> predicates = new ArrayList<>();
        Predicate p = b.equal(root.get("active"), Boolean.FALSE);
        predicates.add(p);
        q.where(predicates.toArray(new Predicate[]{}));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addBusHome(Bushome bushome) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {

            session.save(bushome);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteBusHome(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Bushome bh = session.get(Bushome.class, id);
            session.delete(bh);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateBusHome(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Bushome bh = session.get(Bushome.class, id);
            if (bh.getActive() == Boolean.FALSE) {
                bh.setActive(Boolean.TRUE);
            } else {
                bh.setActive(Boolean.FALSE);
            }
            session.update(bh);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public long countBusHome() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Bushome");
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Bushome getBushomeById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        return session.get(Bushome.class, id);
    }

}
