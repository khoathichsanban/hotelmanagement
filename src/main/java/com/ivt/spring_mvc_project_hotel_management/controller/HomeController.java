/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;

import com.ivt.spring_mvc_project_hotel_management.service.ImageSerivce;
import com.ivt.spring_mvc_project_hotel_management.service.RoomTypeService;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    
    @Autowired
    private ImageSerivce imageSerivce;
    
    @Autowired
    private RoomTypeService roomTypeService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model,HttpSession session) {
        session.setMaxInactiveInterval(60*60);
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        model.addAttribute("images", imageSerivce.getImages());
        Calendar c = Calendar.getInstance();
        Date date = new Date();
        c.setTime(date);
        c.roll(Calendar.DATE, true); 
        SimpleDateFormat DateFor = new SimpleDateFormat("MM/dd/yyyy");
        String checkInDate = DateFor.format(date);
        String checkOutDate = DateFor.format(c.getTime());
        model.addAttribute("dateFrom",checkInDate);
        model.addAttribute("dateTo", checkOutDate);
        return "home";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }
    
    @RequestMapping("/about-us")
    public String aboutPage(Model model){
        return "about-us";
    }
}
