/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.repository;

import com.ivt.spring_mvc_project_hotel_management.entities.ImageEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author This PC
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer>{
    
}
