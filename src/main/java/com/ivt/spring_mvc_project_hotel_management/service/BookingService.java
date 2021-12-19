/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.BookingEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class BookingService {
    
    @Autowired
    private BookingRepository bookingRepository;
    
    public BookingEntity saveBooking(BookingEntity booking){
    return bookingRepository.save(booking);
}
}
