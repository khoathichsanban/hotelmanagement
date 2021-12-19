/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.ImageEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.ImageRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class ImageSerivce {
    
    @Autowired
    private ImageRepository imageRepository;
    
    public List <ImageEntity> getImages(){
        return (List<ImageEntity>) imageRepository.findAll();
    
}
      public ImageEntity getImage(int id){
        Optional<ImageEntity> optional = imageRepository.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return new ImageEntity();
    }
    
}
