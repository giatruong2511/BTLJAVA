/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.controllers;

import com.btl.pojo.Comment;
import com.btl.pojo.User;
import com.btl.service.CommentService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author DELL
 */
@RestController
@RequestMapping("/api")
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    @GetMapping("/bushome/{bushomeId}/comments")
    public ResponseEntity<List<Comment>> getComments(@PathVariable(value="bushomeId") int id) {
        return new ResponseEntity<>(this.commentService.getComments(id), HttpStatus.OK);
    }
    
    
    @PostMapping(path = "/bushome/{bushomeId}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
        String content = params.get("content");
        int id = Integer.parseInt(params.get("bushomeId"));
        Comment c = this.commentService.addComment(content, id);

        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }
}
