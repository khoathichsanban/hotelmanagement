/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.UserEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 *
 * @author This PC
 */
@Controller
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public UserEntity saveUser(UserEntity user){
        return userRepository.save(user);
    }
    
}
