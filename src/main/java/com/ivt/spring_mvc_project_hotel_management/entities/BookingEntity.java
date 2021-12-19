/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.entities;

import com.ivt.spring_mvc_project_hotel_management.enums.BookingStatus;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author This PC
 */
@Entity
@Table(name = "booking")
public class BookingEntity extends PersonalEntity{
    
    @Column
    @Temporal(TemporalType.DATE)
    @DateTimeFormat
    private Date bookingDate;
    
    @Column
    @Temporal(TemporalType.DATE)
    @DateTimeFormat
    private Date checkin;
    
    @Column
    @Temporal(TemporalType.DATE)
    @DateTimeFormat
    private Date checkout;
    
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private BookingStatus status;
    
    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)   
    private List<PaymentEntity> payments;
    
    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL , fetch = FetchType.EAGER)
    private List<BookingDetailEntity> bookingDetails;
    
    @ManyToOne
    @JoinColumn (name="user_id")
    private UserEntity user;

    public BookingEntity() {
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public BookingStatus getStatus() {
        return status;
    }

    public void setStatus(BookingStatus status) {
        this.status = status;
    }

    public List<PaymentEntity> getPayments() {
        return payments;
    }

    public void setPayments(List<PaymentEntity> payments) {
        this.payments = payments;
    }

    public List<BookingDetailEntity> getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(List<BookingDetailEntity> bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

 
    
    
    
}
