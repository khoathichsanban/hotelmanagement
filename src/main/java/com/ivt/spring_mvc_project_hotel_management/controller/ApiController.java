/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.controller;

import com.ivt.spring_mvc_project_hotel_management.entities.BookingDetailEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.BookingEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.CreditCardEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.GuestEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.PaymentEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceBookingEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.ServiceEntity;
import com.ivt.spring_mvc_project_hotel_management.enums.BookingStatus;
import com.ivt.spring_mvc_project_hotel_management.service.BookingDetailService;
import com.ivt.spring_mvc_project_hotel_management.service.BookingService;
import com.ivt.spring_mvc_project_hotel_management.service.CreditCardService;
import com.ivt.spring_mvc_project_hotel_management.service.GuestService;
import com.ivt.spring_mvc_project_hotel_management.service.Mailer;
import com.ivt.spring_mvc_project_hotel_management.service.PaymentService;
import com.ivt.spring_mvc_project_hotel_management.service.ServiceBookingService;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author This PC
 */
@Controller
@RequestMapping("api/")
public class ApiController {

    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private GuestService guestService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @Autowired
    private Mailer mailer;

    @RequestMapping(value = "payment-return-message")
    @ResponseBody
    public String payment(Model model, HttpSession session,
            @SessionAttribute("dateFrom") Date dateFrom,
            @SessionAttribute("dateTo") Date dateTo,
            @ModelAttribute("payment") PaymentEntity payment,
            @RequestParam("fullName") String fullName,
            @RequestParam("cardNumber") String cardNumber,
            @RequestParam("expDate") String expDate,
            @RequestParam("cvvCode") String cvvCode,
            @SessionAttribute("guest") GuestEntity guest,
            @RequestParam(value = "type", required = false) String type,
            RoomEntity room, ServiceEntity service) throws Exception {

        HashMap<Long, BookingDetailEntity> cartBookings = (HashMap<Long, BookingDetailEntity>) session.getAttribute("myBookings");
        if (cartBookings == null) {
            cartBookings = new HashMap<>();
        }
        double amount = (double) session.getAttribute("myCartTotal") + totalServices(cartBookings);
        DecimalFormat formatter = new DecimalFormat("###,###,###.##");
        String moneyString = formatter.format(amount);
        Date today = new Date();
        CreditCardEntity creditCard = creditCardService.getCreditCard(fullName, cardNumber);
        if (creditCard == null) {
            return "error1";
        } else {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String exp = df.format(creditCard.getExpDate());
            if (!creditCard.getCvvCode().equalsIgnoreCase(cvvCode)
                    || !exp.equalsIgnoreCase(expDate)) {
                return "error2";
            }else{
            if (creditCard.getExpDate().before(today)) {
                return "error3";
            }
            if (creditCard.getBalance() < amount) {
                return "error4";
            }
            creditCard.setBalance(creditCard.getBalance() - amount);
            creditCardService.saveCreditCard(creditCard);
            guest.setGender(guest.getGender());
            guestService.saveGuest(guest);

            BookingEntity booking = new BookingEntity();
            booking.setBookingDate(today);
            booking.setCheckin(dateFrom);
            booking.setCheckout(dateTo);
            booking.setAddress(guest.getAddress());
            booking.setBirthDate(guest.getBirthDate());
            booking.setEmail(guest.getEmail());
            booking.setFullName(guest.getFullName());
            booking.setGender(guest.getGender());
            booking.setCreateDate(today);
            booking.setPhoneNumber(guest.getPhoneNumber());
            booking.setStatus(BookingStatus.BOOKED);
            bookingService.saveBooking(booking);

            PaymentEntity receiptItem = new PaymentEntity();
            receiptItem.setCreditCard(creditCard);
            receiptItem.setAmount(amount);
            receiptItem.setPaymentDate(today);
            receiptItem.setBooking(booking);
            paymentService.savePayment(receiptItem);

            for (Map.Entry<Long, BookingDetailEntity> itemsCart : cartBookings.entrySet()) {

                BookingDetailEntity bookingDetail = new BookingDetailEntity();
                bookingDetail.setRoom(itemsCart.getValue().getRoom());
                bookingDetail.setPrice(itemsCart.getValue().getRoom().getRoomType().getPrice());
                bookingDetail.setBooking(booking);
                bookingDetailService.saveBookingDetail(bookingDetail);

                List<ServiceBookingEntity> serviceBookings = itemsCart.getValue().getServiceBooking();
                if (serviceBookings == null) {
                    serviceBookings = new ArrayList<>();
                }
                for (ServiceBookingEntity serviceBooking : serviceBookings) {
                    serviceBooking.setBookingDetail(bookingDetailService.getBookingDetail(bookingDetail.getId()));
                    serviceBooking.setPrice(serviceBooking.getService().getPrice());
                    serviceBookingService.saveServiceBooking(serviceBooking);
                }
            }
            try {
                String pattern = "dd/MM/yyyy";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                String checkInDate = simpleDateFormat.format(dateFrom);
                String checkOutDate = simpleDateFormat.format(dateTo);
                StringBuffer sb = new StringBuffer("");
                sb.append("Dear ")
                        .append(guest.getFullName())
                        .append("\n")
                        .append("We are pleased to inform you that your booking ")
                        .append(booking.getId())
                        .append(" is confirmed.")
                        .append("\n")
                        .append("Your check-in :")
                        .append(checkInDate)
                        .append("\n")
                        .append("Your check-out : ")
                        .append(checkOutDate)
                        .append("\n")
                        .append("Reservation details:\n")
                        .append("\n")
                        .append(getBookingDetails(cartBookings).toString())
                        .append("\n")
                        .append("Amount: ")
                        .append(moneyString)
                        .append("VND")
                        .append("\n")
                        .append("Sincerely awaiting your visit. ");
                String content = sb.toString();
                mailer.sendSimpleMessage(guest.getEmail(), "YOUR RESERVATION IS CONFIRMED", content);
                System.out.println("mail sucess");
            } catch (Exception e) {
                System.out.println("mail fail");
            }
            session.removeAttribute("myServiceBookings");
        }
        }
       return "payment"; 
    }

    

    public double totalServices(HashMap<Long, BookingDetailEntity> BookingDetailEntity) {
        int count = 0;
        for (Map.Entry<Long, BookingDetailEntity> list : BookingDetailEntity.entrySet()) {
            List<ServiceBookingEntity> serviceBookings = list.getValue().getServiceBooking();
            if (serviceBookings == null) {
                serviceBookings = new ArrayList<>();
            }
            for (ServiceBookingEntity serviceBooking : serviceBookings) {
                count += serviceBooking.getService().getPrice() * serviceBooking.getQuantity();
            }
        }
        return count;
    }

    public StringBuilder getBookingDetails(HashMap<Long, BookingDetailEntity> BookingDetailEntity) {
        StringBuilder str = new StringBuilder();
        for (Map.Entry<Long, BookingDetailEntity> itemsCart : BookingDetailEntity.entrySet()) {
            str.append("Room name: ");
            str.append(itemsCart.getValue().getRoom().getRoomType().getName());
            str.append(itemsCart.getValue().getRoom().getRoomNumber());
            str.append("\n");
            double price =itemsCart.getValue().getRoom().getRoomType().getPrice();
            DecimalFormat formatter = new DecimalFormat("###,###,###.##");
            String moneyString = formatter.format(price);
            str.append("Room Price:");
            str.append(moneyString);
            str.append("VND");
            str.append("\n");

            List<ServiceBookingEntity> serviceBookings = itemsCart.getValue().getServiceBooking();
            if (serviceBookings == null) {
                serviceBookings = new ArrayList<>();
            }
            str.append("Service: ");
            for (ServiceBookingEntity serviceBooking : serviceBookings) {
                str.append(serviceBooking.getService().getName());
                str.append(", ");
            }
            str.append("\n");
            str.append("Unit price:");
            str.append(formatter.format(itemsCart.getValue().getPrice()));
            str.append("VND");
            str.append("\n");       
            str.append("-------------------------------------------");
            str.append("\n");
        }
        return str;
    }
}
