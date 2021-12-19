/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.RoomTypeRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class RoomTypeService {
    
    @Autowired
    private RoomTypeRepository roomTypeRepository;
    
    public List<RoomTypeEntity> getRoomTypes(){
        
        return (List<RoomTypeEntity>) roomTypeRepository.findAll();
    }
    
    public RoomTypeEntity getRoomType(int id){
        Optional<RoomTypeEntity> optional = roomTypeRepository.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return new RoomTypeEntity();
    }
    
}
