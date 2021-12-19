/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.entities;

import com.ivt.spring_mvc_project_hotel_management.enums.PromotionStatus;
import com.ivt.spring_mvc_project_hotel_management.enums.UserStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name = "promotion")
public class PromotionEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 100)
    private String name;

    @Column(length = 1000)
    private String description;

    @Temporal(TemporalType.DATE)
    @Column(name = "start_date")
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "end_date")
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date endDate;

    @Column
    private int discount;
    
    @Temporal(TemporalType.DATE)
    @Column(name = "create_date")
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date createDate;

     @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private PromotionStatus status;

    @Column
    private String image;

    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL)
    private List<ServiceBookingEntity> serviceBooking;
    
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "roomType_promotion_relationship",
            joinColumns = @JoinColumn(name = "promotion_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "room_type_id",
                    referencedColumnName = "id"))
    private Set<RoomTypeEntity> roomTypes;

    public PromotionEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public PromotionStatus getStatus() {
        return status;
    }

    public void setStatus(PromotionStatus status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<ServiceBookingEntity> getServiceBooking() {
        return serviceBooking;
    }

    public void setServiceBooking(List<ServiceBookingEntity> serviceBooking) {
        this.serviceBooking = serviceBooking;
    }

    public Set<RoomTypeEntity> getRoomTypes() {
        return roomTypes;
    }

    public void setRoomTypes(Set<RoomTypeEntity> roomTypes) {
        this.roomTypes = roomTypes;
    }
    
    
}
