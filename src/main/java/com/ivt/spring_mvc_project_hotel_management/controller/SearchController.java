/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;

import com.ivt.spring_mvc_project_hotel_management.entities.BookingDetailEntity;
import com.ivt.spring_mvc_project_hotel_management.service.ImageSerivce;
import com.ivt.spring_mvc_project_hotel_management.service.RoomService;
import com.ivt.spring_mvc_project_hotel_management.service.RoomTypeService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author This PC
 */
@Controller
public class SearchController {

    @Autowired
    private ImageSerivce imageSerivce;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = {"/search-room"}, method = RequestMethod.GET)
    public String searchRoom(Model model, HttpSession session,
            @ModelAttribute("dateFrom") String dateFrom,
            @ModelAttribute("dateTo") String dateTo,
            @ModelAttribute("roomType") int roomTypeId)
            throws ParseException {

        Date checkin_date = new SimpleDateFormat("MM/dd/yyyy").parse(dateFrom);
        Date checkout_date = new SimpleDateFormat("MM/dd/yyyy").parse(dateTo);
        model.addAttribute("room", roomService.searchRooms(checkin_date, checkout_date, roomTypeId));
        model.addAttribute("roomType", roomTypeService.getRoomType(roomTypeId));
        model.addAttribute("images", imageSerivce.getImage(roomTypeId));
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        session.setAttribute("dateFrom", dateFrom);
        session.setAttribute("dateTo", dateTo);
        return "view-room";
    }

     @RequestMapping(value = {"/search-room-1"}, method = RequestMethod.GET)
    public String searchRoom1(Model model, HttpSession session,
            @ModelAttribute("dateFrom") String dateFrom,
            @ModelAttribute("dateTo") String dateTo,
            @ModelAttribute("roomType") int roomTypeId)
            throws ParseException {
        String dateFromSearch = session.getAttribute("dateFrom").toString();
        String dateToSearch = session.getAttribute("dateTo").toString();
        if (!dateFrom.equals(dateFromSearch) || !dateTo.equals(dateToSearch)) {
            HashMap<Long, BookingDetailEntity> cartBookingss = new HashMap<Long, BookingDetailEntity>();
            session.setAttribute("myBookings", cartBookingss);
        }

        Date checkin_date = new SimpleDateFormat("MM/dd/yyyy").parse(dateFrom);
        Date checkout_date = new SimpleDateFormat("MM/dd/yyyy").parse(dateTo);
        model.addAttribute("room", roomService.searchRooms(checkin_date, checkout_date, roomTypeId));
        model.addAttribute("roomType", roomTypeService.getRoomType(roomTypeId));
        model.addAttribute("images", imageSerivce.getImage(roomTypeId));
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        session.setAttribute("dateFrom", dateFrom);
        session.setAttribute("dateTo", dateTo);
        return "view-room";
    }

}
