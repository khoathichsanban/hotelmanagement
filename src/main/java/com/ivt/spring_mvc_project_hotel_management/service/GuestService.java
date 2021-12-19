/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.CreditCardEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.GuestEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.GuestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class GuestService {
    
    @Autowired
    private GuestRepository guestRepository;
    
    public void saveGuest(GuestEntity guest){
         guestRepository.save(guest);
    }
    
}
