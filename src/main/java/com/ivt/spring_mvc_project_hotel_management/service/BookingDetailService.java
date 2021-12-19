/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.BookingDetailEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.BookingDetailRepository;
import com.ivt.spring_mvc_project_hotel_management.repository.BookingRepository;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class BookingDetailService {
    
    @Autowired
    private BookingDetailRepository bookingDetailRepository;
    
    public BookingDetailEntity saveBookingDetail(BookingDetailEntity bookingDetail){
        return bookingDetailRepository.save(bookingDetail);
    }
    
    public BookingDetailEntity findBookingDetail(int bookingId, long roomId){
        return bookingDetailRepository.findByBooking_IdAndRoom_Id(bookingId, roomId);
    }
    
    public BookingDetailEntity getBookingDetail(int id){
        Optional<BookingDetailEntity> optional = bookingDetailRepository.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return new BookingDetailEntity();
    }
    
}
