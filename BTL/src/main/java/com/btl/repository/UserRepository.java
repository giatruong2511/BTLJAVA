/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.btl.repository;

import com.btl.pojo.User;

public interface UserRepository {
    User getUserByUsername(String username);
    boolean addUser(User user);
    long countUser();
}
