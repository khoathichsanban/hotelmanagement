/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;

import com.ivt.spring_mvc_project_hotel_management.entities.BookingDetailEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.GuestEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import com.ivt.spring_mvc_project_hotel_management.enums.Gender;
import com.ivt.spring_mvc_project_hotel_management.service.RoomTypeService;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author This PC
 */
@Controller
public class CheckOutController {

    @Autowired
    private RoomTypeService roomTypeService;



    @RequestMapping(value = "check-out", method = RequestMethod.GET)
    public String checkOut(Model model, HttpSession session,
            RoomTypeEntity roomType,
            @SessionAttribute("dateFrom") Date dateFrom,
            @SessionAttribute("dateTo") Date dateTo,
            @SessionAttribute("myBookings") HashMap<Long, BookingDetailEntity> myBookings,
            @SessionAttribute("myCartTotal") double total) {

        model.addAttribute("roomType", roomTypeService.getRoomTypes());
        model.addAttribute("guest", new GuestEntity());
        model.addAttribute("genders", Gender.values());
        model.addAttribute("bookingDate", new Date());
        return "check-out";
    }

    @RequestMapping(value = "result", method = RequestMethod.POST)
    public String viewInfo(Model model, HttpSession session,
            RoomTypeEntity roomType,
            @SessionAttribute("dateFrom") Date dateFrom,
            @SessionAttribute("dateTo") Date dateTo,
            @ModelAttribute("guest") GuestEntity guest,
            @SessionAttribute("myBookings") HashMap<Long, BookingDetailEntity> myBookings,
            @SessionAttribute("myCartTotal") double total) {

        model.addAttribute("roomType", roomTypeService.getRoomTypes());
        model.addAttribute("guest", new GuestEntity());
        session.setAttribute("guest", guest);
        return "pay-ment";
    }

    

}
