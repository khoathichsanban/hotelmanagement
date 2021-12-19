package com.ivt.spring_mvc_project_hotel_management.controller;
import com.ivt.spring_mvc_project_hotel_management.entities.BookingDetailEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.BookingEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceEntity;
import com.ivt.spring_mvc_project_hotel_management.service.RoomService;
import com.ivt.spring_mvc_project_hotel_management.service.RoomTypeService;
import com.ivt.spring_mvc_project_hotel_management.service.ServiceService;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author This PC
 */
@Controller
public class BookingController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private ServiceService serviceService;

    @RequestMapping(value = "add/{id}/{roomId}", method = RequestMethod.GET)
    public String viewAdd(Model model, HttpSession session, @PathVariable("roomId") long roomId,
            ServiceEntity service,
            @PathVariable("id") int id,
            @SessionAttribute("dateFrom") Date dateFrom,
            @SessionAttribute("dateTo") Date dateTo) {
        HashMap<Long, BookingDetailEntity> cartBookings = (HashMap<Long, BookingDetailEntity>) session.getAttribute("myBookings");
        if (cartBookings == null) {
            cartBookings = new HashMap<>();
        }
        RoomEntity room = roomService.getRoom(roomId);
        if (room != null) {
            
            if (cartBookings.containsKey(roomId)) {
                BookingDetailEntity booking = cartBookings.get(roomId);
                booking.setRoom(room);
                cartBookings.put(roomId, booking);
            } else {
                BookingDetailEntity booking = new BookingDetailEntity();
                booking.setRoom(room);
                booking.getRoom().setRoomType(roomTypeService.getRoomType(id));
                booking.getServiceBooking();
                cartBookings.put(roomId, booking);
            } 
        }
        session.setAttribute("roomTypeId", id);
        session.setAttribute("roomId", roomId);
        session.setAttribute("myBookings", cartBookings);
        session.setAttribute("myCartTotal", totalPrice(cartBookings));
        model.addAttribute("roomType", roomTypeService.getRoomType(id));
        model.addAttribute("services", serviceService.getServices());
        model.addAttribute("booking", new BookingEntity());
        model.addAttribute("bookingDate", new Date());

        return "cart-booking";
    }
    @RequestMapping(value = "remove/{id}/{roomId}", method = RequestMethod.GET)
    public String viewRemove(Model model, HttpSession session, @PathVariable("roomId") long roomId,
            @PathVariable("id") int id) {
        HashMap<Long, BookingDetailEntity> cartBookings = (HashMap<Long, BookingDetailEntity>) session.getAttribute("myBookings");
        if (cartBookings == null) {
            cartBookings = new HashMap<>();
        }
        if (cartBookings.containsKey(roomId)) {
            cartBookings.remove(roomId);
        }
        
        session.setAttribute("myBookings", cartBookings);
        session.setAttribute("myCartTotal", totalPrice(cartBookings));
        model.addAttribute("roomType", roomTypeService.getRoomType(id));
        model.addAttribute("services", serviceService.getServices());
        model.addAttribute("booking", new BookingEntity());
       
        return "cart-booking";
    }

    public double totalPrice(HashMap<Long, BookingDetailEntity> BookingDetailEntity) {
        int count = 0;
        for (Map.Entry<Long, BookingDetailEntity> list : BookingDetailEntity.entrySet()) {
            count += list.getValue().getRoom().getRoomType().getPrice();
        }
        return count;
    }

    

}
