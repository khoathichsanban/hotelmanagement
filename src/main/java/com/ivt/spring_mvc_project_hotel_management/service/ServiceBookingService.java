/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.PaymentEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceBookingEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.ServiceBookingRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class ServiceBookingService {
    
    @Autowired
    private ServiceBookingRepository serviceBookingRepository;
    
    public List<ServiceBookingEntity> getServiceBookings(int id){
        return serviceBookingRepository.findByService_Id(id);
    }
    
    public ServiceBookingEntity saveServiceBooking(ServiceBookingEntity serviceBooking){
        return serviceBookingRepository.save(serviceBooking);
    }
    
}
