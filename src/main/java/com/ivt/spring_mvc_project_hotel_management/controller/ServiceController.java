/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;
import com.ivt.spring_mvc_project_hotel_management.entities.BookingDetailEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.BookingEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceBookingEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceEntity;
import com.ivt.spring_mvc_project_hotel_management.service.RoomService;
import com.ivt.spring_mvc_project_hotel_management.service.RoomTypeService;
import com.ivt.spring_mvc_project_hotel_management.service.ServiceService;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
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
public class ServiceController {

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "service/{roomId}", method = RequestMethod.GET)
    public String servicePage(Model model, HttpSession session,
            @PathVariable("roomId") long roomId, RoomTypeEntity roomType,
            @SessionAttribute("dateFrom") Date dateFrom,
            @SessionAttribute("dateTo") Date dateTo,
            @SessionAttribute("myBookings") HashMap<Long, BookingDetailEntity> cartBookings) {

        session.setAttribute("myServiceBookings", new ArrayList<ServiceBookingEntity>());
        session.setAttribute("roomAddService", cartBookings.get(roomId));
        session.setAttribute("bookingService", cartBookings.get(roomId));
        session.setAttribute("room", roomService.getRoom(roomId));
        model.addAttribute("roomType", roomTypeService.getRoomType(roomType.getId()));
        model.addAttribute("services", serviceService.getServices());
        return "service";

    }
    
    
    @RequestMapping(value = "add-api-service", method = RequestMethod.GET)
    public  String view(Model model, HttpSession session,HttpServletRequest request, 
            @RequestParam("quantity") int quantity,
            @RequestParam("serviceId") int serviceId,
            @SessionAttribute("dateFrom") Date dateFrom,
            @SessionAttribute("dateTo") Date dateTo,
            @SessionAttribute("room") RoomEntity room,
            @SessionAttribute("myBookings") HashMap<Long, BookingDetailEntity> cartBookings,
            @SessionAttribute("myServiceBookings") List<ServiceBookingEntity> cartServiceBookings
           ) {

        ServiceBookingEntity serviceBooking;
        model.addAttribute("services", serviceService.getServices());
        model.addAttribute("room", roomService.getRoom(room.getId()));
        ServiceEntity service = serviceService.getService(serviceId);
        for (ServiceBookingEntity cartServiceBooking1 : cartServiceBookings) {
            if (service.getId() == cartServiceBooking1.getService().getId()) {
                int quantity1 = quantity + cartServiceBooking1.getQuantity();
                cartServiceBooking1.setQuantity(quantity1);
                cartServiceBooking1.setPrice(service.getPrice() * quantity1);
                session.setAttribute("totalService", totalPrice(cartServiceBookings));
                return "load-service";
            }
        }
        serviceBooking = new ServiceBookingEntity();
        serviceBooking.setService(service);
        serviceBooking.setQuantity(quantity);
        serviceBooking.setPrice(quantity * service.getPrice());
        cartServiceBookings.add(serviceBooking);
        session.setAttribute("totalService", totalPrice(cartServiceBookings));
    
        return "load-service";
    }

    @RequestMapping(value = "remove-service", method = RequestMethod.GET)
    public String Remove(Model model, HttpSession session,
            @PathParam("index") int index,
            @SessionAttribute("room") RoomEntity room,
            @SessionAttribute("myBookings") HashMap<Long, BookingDetailEntity> cartBookings,
            @SessionAttribute("myServiceBookings") List<ServiceBookingEntity> cartServiceBookings) {

        cartServiceBookings.remove(cartServiceBookings.get(index));

        session.setAttribute("myServiceBookings", cartServiceBookings);
        session.setAttribute("totalService", totalPrice(cartServiceBookings));
        model.addAttribute("myServiceBooking", new ServiceBookingEntity());
        model.addAttribute("services", serviceService.getServices());
        return "load-service";
    }

    @RequestMapping(value = "view-service", method = RequestMethod.GET)
    public String viewServiceBooking(Model model, HttpSession session,
            @SessionAttribute("myBookings") HashMap<Long, BookingDetailEntity> myBookings,
            @SessionAttribute("myServiceBookings") List<ServiceBookingEntity> cartServiceBookings,
            @SessionAttribute("roomAddService") BookingDetailEntity roomAddService) {

        roomAddService.setServiceBooking(cartServiceBookings);
        roomAddService.setPrice(totalPrice(cartServiceBookings)+roomAddService.getRoom().getRoomType().getPrice());
        myBookings.put(roomAddService.getRoom().getId(), roomAddService);
        session.removeAttribute("totalService");
        model.addAttribute("services", serviceService.getServices());
        BookingEntity booking = new BookingEntity();

        model.addAttribute("booking", booking);
        model.addAttribute("bookingDate", new Date());

        return "cart-booking";
    }

    public double totalPrice(List<ServiceBookingEntity> cartServiceBookings) {
        int count = 0;
        for (ServiceBookingEntity cartServiceBooking : cartServiceBookings) {
            count += cartServiceBooking.getService().getPrice() * cartServiceBooking.getQuantity();
        }
        return count;
    }

}
