/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.btl.service;

import com.btl.pojo.User;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author duonghuuthanh
 */
public interface UserService extends UserDetailsService {
    User getUserByUsername(String username);
    boolean addUser(User user);
    long countUser();

}
