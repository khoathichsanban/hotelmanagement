/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.entities;

import com.ivt.spring_mvc_project_hotel_management.enums.RoomStatus;
import com.ivt.spring_mvc_project_hotel_management.enums.UserStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author KT
 */
@Entity
@Table(name="room")

public class RoomEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(length = 100)
    private String roomNumber;
    
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private RoomStatus status;
    
    @Column
    private int numberOfBed;
    
    @Temporal(TemporalType.DATE)
    @Column(name= "create_date")
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date createDate;
    
    @ManyToOne
    @JoinColumn(name = "roomType_id")
    private RoomTypeEntity roomType;
    
    
    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL)
    private List<BookingDetailEntity> bookingDetail;

    public RoomEntity() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public RoomStatus getStatus() {
        return status;
    }

    public void setStatus(RoomStatus status) {
        this.status = status;
    }

    public int getNumberOfBed() {
        return numberOfBed;
    }

    public void setNumberOfBed(int numberOfBed) {
        this.numberOfBed = numberOfBed;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }

    public List<BookingDetailEntity> getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(List<BookingDetailEntity> bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    
}
