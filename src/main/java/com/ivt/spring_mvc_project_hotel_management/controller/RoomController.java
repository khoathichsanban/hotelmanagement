/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;

import com.ivt.spring_mvc_project_hotel_management.service.ImageSerivce;
import com.ivt.spring_mvc_project_hotel_management.service.RoomService;
import com.ivt.spring_mvc_project_hotel_management.service.RoomTypeService;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author This PC
 */
@Controller
public class RoomController {

    @Autowired
    private ImageSerivce imageSerivce;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = {"rooms"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        model.addAttribute("images", imageSerivce.getImages());
        return "rooms";
    }

    @RequestMapping("view-detail/{id}")
    public String viewDetailRoom(Model model,
            @PathVariable("id") int id) {
        model.addAttribute("roomType", roomTypeService.getRoomType(id));
        model.addAttribute("images", imageSerivce.getImage(id));
        model.addAttribute("room", roomService.getRoomById(id));
        Calendar c = Calendar.getInstance();
        Date date = new Date();
        c.setTime(date);
        c.roll(Calendar.DATE, true); 
        SimpleDateFormat DateFor = new SimpleDateFormat("MM/dd/yyyy");
        String checkInDate = DateFor.format(date);
        String checkOutDate = DateFor.format(c.getTime());
        model.addAttribute("dateFrom",checkInDate);
        model.addAttribute("dateTo", checkOutDate);
        return "room-detail";
    }

}
