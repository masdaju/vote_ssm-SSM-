package edu.example.dao;

import edu.example.entity.Kiroku;
import edu.example.entity.Ticket;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketDao {
List<Ticket> selectTicket();

    List<Ticket> selectTicketById(int vid);
     int agreeT(int vid);
     int    disagreeT(int vid);
    int insertKiroku(@Param("kiroku") Kiroku kiroku);


}
