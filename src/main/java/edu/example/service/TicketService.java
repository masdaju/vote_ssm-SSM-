package edu.example.service;

import edu.example.dao.NaiyouDao;
import edu.example.dao.TicketDao;
import edu.example.entity.Kiroku;
import edu.example.entity.Naiyou;
import edu.example.entity.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class TicketService {
    @Autowired
    private TicketDao ticketDao;

    public  List<Ticket> selectTicket(){
        return ticketDao.selectTicket();
    }


    public int Voteyes(Kiroku kiroku) {
        if (ticketDao.insertKiroku(kiroku)>0) {
            return ticketDao.agreeT(kiroku.getVid());
        }
        return 0;
    }
    public  int Voteno(Kiroku kiroku){
        if (ticketDao.insertKiroku(kiroku) > 0) {
        return ticketDao.disagreeT(kiroku.getVid());
    }
        return 0;
}
}
