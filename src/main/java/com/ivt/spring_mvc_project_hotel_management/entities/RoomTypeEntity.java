/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.entities;

import com.ivt.spring_mvc_project_hotel_management.enums.RoomStatus;
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
@Table(name="room_type")
public class RoomTypeEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length = 100)
    private String name;
    
    @Column(length = 1000)
    private String description;
    
    @Column
    private int guest;
    
    @Column
    private int size;
    
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private RoomStatus status;
    
    @Column
    private double price;
    
    @Temporal(TemporalType.DATE)
    @Column(name= "create_date")
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date createDate;
    
    @OneToMany(mappedBy = "roomType", cascade = CascadeType.ALL)
    private List<RoomEntity> rooms;
    
    @OneToMany(mappedBy = "roomType", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ImageEntity> images;
    
    @ManyToMany(mappedBy = "roomTypes")
    private Set<ConvenientEntity> convenients;
    
    @ManyToMany(mappedBy = "roomTypes")
    private Set<PromotionEntity> promotions;

    public RoomTypeEntity() {
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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public RoomStatus getStatus() {
        return status;
    }

    public void setStatus(RoomStatus status) {
        this.status = status;
    }



    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public List<RoomEntity> getRooms() {
        return rooms;
    }

    public void setRooms(List<RoomEntity> rooms) {
        this.rooms = rooms;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

    public Set<ConvenientEntity> getConvenients() {
        return convenients;
    }

    public void setConvenients(Set<ConvenientEntity> convenients) {
        this.convenients = convenients;
    }

    public Set<PromotionEntity> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<PromotionEntity> promotions) {
        this.promotions = promotions;
    }

    public int getGuest() {
        return guest;
    }

    public void setGuest(int guest) {
        this.guest = guest;
    }
    
    

}
