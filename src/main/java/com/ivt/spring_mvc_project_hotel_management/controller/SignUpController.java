/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;

import com.ivt.spring_mvc_project_hotel_management.entities.UserEntity;
import com.ivt.spring_mvc_project_hotel_management.enums.UserStatus;
import com.ivt.spring_mvc_project_hotel_management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author This PC
 */
@Controller
public class SignUpController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping("/sign-up")
    public String SignUpPage(Model model){
        model.addAttribute("user", new UserEntity());
        return "sign-up";
    }
    
    @RequestMapping(value = "resgiter", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("user") UserEntity user,
            @RequestParam("email")String email){
        if(email.equalsIgnoreCase(user.getEmail())){
            System.out.println("email trung");
        }
        user.setStatus(UserStatus.ACTIVE);
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
        userService.saveUser(user);
        return "login";
    }
    
    
    
}   
