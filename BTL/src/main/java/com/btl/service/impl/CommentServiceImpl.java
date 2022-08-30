/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.service.impl;

import com.btl.pojo.Comment;
import com.btl.repository.CommentRepository;
import com.btl.service.CommentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;
    
    @Override
    public List<Comment> getComments(int bushomeid) {
        return this.commentRepository.getComments(bushomeid);
    }

    @Override
    public Comment addComment(String content, int bushomeid) {
        return this.commentRepository.addComment(content, bushomeid);
    }
    
}
