/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ivt.spring_mvc_project_hotel_management.repository;

import com.ivt.spring_mvc_project_hotel_management.entities.RoomEntity;
import com.ivt.spring_mvc_project_hotel_management.entities.RoomTypeEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.core.CrudMethods;
import org.springframework.stereotype.Repository;

/**
 *
 * @author This PC
 */
@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Long> {

    @Query(value = "SELECT * FROM room r\n"
            + "join room_type rt on rt.id = r.roomtype_id\n"
            + "join image i on rt.id = i.room_type_id\n"
            + "where r.id not in\n"
            + "(SELECT r.id FROM room r\n"
            + "		   join room_type rt on rt.id = r.roomtype_id\n"
            + "            left join booking_detail bt on bt.room_id = r.id\n"
            + "            left join booking b on b.id = bt.booking_id\n"
            + "            where (b.status = \"BOOKED\" or b.status = \"CHECK_IN\") \n"
            + "            and (?1 BETWEEN b.checkin AND b.checkout) \n"
            + "             AND (?2  BETWEEN b.checkin AND b.checkout))\n"
            + "and rt.id =?3\n"
            + "group by r.id;", nativeQuery = true)
    List<RoomEntity> searchRoom(Date dateFrom, Date dateTo, int id);

    @Query(value = "SELECT * FROM room r\n"
            + "join room_type rt\n"
            + "on r.roomType_id = rt.id\n"
            + "where rt.id =?1", nativeQuery = true)
    List<RoomEntity> getRoomById(int id);

    List<RoomEntity> findByRoomType_Id(int id);
}
