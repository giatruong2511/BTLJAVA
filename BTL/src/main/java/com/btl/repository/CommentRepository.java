/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.repository;

import com.btl.pojo.Comment;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface CommentRepository {
    List<Comment> getComments(int bushomeid);
    Comment addComment(String content, int bushomeid);
}
