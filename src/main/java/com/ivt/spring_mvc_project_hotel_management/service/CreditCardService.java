/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.CreditCardEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.CreditCardRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author This PC
 */
@Service
public class CreditCardService {
    
    @Autowired
    private CreditCardRepository creditCardRepository;
    
    public List<CreditCardEntity> getCreditCards(){
        return  (List<CreditCardEntity>) creditCardRepository.findAll();
    }
    
    public CreditCardEntity getCreditCard(String name, String number){
        return creditCardRepository.findByNameAndCardNumber(name, number);
    }
    
     public CreditCardEntity getCredit(int id){
        Optional<CreditCardEntity> optional = creditCardRepository.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return new CreditCardEntity();
    }
    
    public void saveCreditCard(CreditCardEntity creditCard){
         creditCardRepository.save(creditCard);
    }
    
 
        
    
}

