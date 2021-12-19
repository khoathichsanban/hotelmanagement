/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author KT
 */
@Entity
@Table(name = "service_booking")
public class ServiceBookingEntity implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column
    private double price;
    
    @Column
    private int quantity;
    
    @ManyToOne
    @JoinColumn(name = "booking_detail_id")
    private BookingDetailEntity bookingDetail;
     
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity service;

    public ServiceBookingEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BookingDetailEntity getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(BookingDetailEntity bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }
    
    
}
