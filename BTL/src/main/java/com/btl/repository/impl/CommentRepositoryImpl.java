/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.repository.impl;

import com.btl.pojo.Bushome;
import com.btl.pojo.Comment;
import com.btl.pojo.User;
import com.btl.repository.CommentRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class CommentRepositoryImpl implements CommentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    @Autowired
    private HttpSession sessions;
    @Override
    public List<Comment> getComments(int bushomeid) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Comment> q = b.createQuery(Comment.class);
        Root root = q.from(Comment.class);

        q.where(b.equal(root.get("bushomeId"), bushomeid));
        q.orderBy(b.desc(root.get("id")));
        
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public Comment addComment(String content, int bushomeid) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        User user  = (User) sessions.getAttribute("currentUser");
        Comment c = new Comment();
        c.setContent(content);
        c.setBushomeId(session.get(Bushome.class, bushomeid));
        c.setUserId(session.get(User.class, user.getId()));

        session.save(c);

        return c;
    }
    
}
