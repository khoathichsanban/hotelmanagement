/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class ServiceService {
    
    @Autowired
    private ServiceRepository serviceRepository;
    
    public List<ServiceEntity> getServices(){
        return (List<ServiceEntity>) serviceRepository.findAll();
    }
    
    public ServiceEntity getService(long id){
        Optional<ServiceEntity> optional = serviceRepository.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return new ServiceEntity();
    }
    
}
