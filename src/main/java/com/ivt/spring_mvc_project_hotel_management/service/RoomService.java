/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.service;

import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import com.ivt.spring_mvc_project_hotel_management.repository.RoomRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author This PC
 */
@Service
public class RoomService {
    
    @Autowired
    private RoomRepository roomRepository;
    
    public List<RoomEntity> getRooms(){
        return (List<RoomEntity>) roomRepository.findAll();
    }
    
    public RoomEntity getRoom(long id){
        Optional<RoomEntity> optional = roomRepository.findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return new RoomEntity();
    }
    
    public List<RoomEntity> searchRooms(Date dateFrom, Date dateTo,int id){
        return (List<RoomEntity>) roomRepository.searchRoom(dateFrom,dateTo,id);
    }
    
    public List<RoomEntity> getRoomById(int id){
        return (List<RoomEntity>) roomRepository.findByRoomType_Id(id);
    }
    
    
    
}
