package edu.example.controller;

import edu.example.entity.Kiroku;
import edu.example.entity.Naiyou;
import edu.example.entity.Ticket;
import edu.example.service.KirokuService;
import edu.example.service.NaiyouService;
import edu.example.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/TicketManage")
public class TicketController {
    @Autowired
    TicketService ticketService;
    @Autowired
    KirokuService kirokuService;
    @Autowired
    NaiyouService naiyouService;
    //查询所有投票
    @RequestMapping("/Ticket")
    public String TicketManage(Model model){
        List<Ticket> TicketList= ticketService.selectTicket();
        model.addAttribute("TicketList",TicketList);
        return "tTicket";
    }
//投票不同意
    @PostMapping("/voteAgree")
    @ResponseBody
    public boolean updateTA(@RequestBody Kiroku kiroku){

        if (ticketService.Voteyes(kiroku)>0){
            return true;
        }
        return false;
    }
    //投票同意
    @PostMapping("/voteDisagree")
    @ResponseBody
    public boolean updateTD(@RequestBody Kiroku kiroku){
        if (ticketService.Voteno(kiroku)>0){
            return true;
        }
        return false;
    }

    @RequestMapping("/detail")
    public String detail(@RequestBody()  Naiyou  naiyou,Model model){
//        Naiyou naiyou1=new Naiyou();
//        naiyou1.setAgree(naiyou.getAgree());
//        naiyou1.setDisagree(naiyou.getDisagree());
//        naiyou1.setContext(naiyou.getContext());
//        naiyou1.setNtime(naiyou.getNtime());
//        naiyou1.setLim(naiyou.getLim());
//        naiyou1.setTitle(naiyou.getTitle());
//        naiyou1.setState(naiyou.getState());
//        System.out.println(naiyou);
        model.addAttribute("naiyou", naiyou);
        System.out.println(model);
        return "voteDetail";
    }

    //投票详情通过vid多表查询
    @RequestMapping("detailVid/{vid}")
    public String detailVID(@PathVariable("vid") int vid, Model model){
        Naiyou naiyou =naiyouService.seletedetail(vid);
        model.addAttribute("naiyou", naiyou);
        return "voteDetail";
    }

//    http://localhost:8080/TicketManage/detail
//验证此用户是否超过投票限制
    @PostMapping("/forVerify")
    @ResponseBody
    public boolean forVerify(@RequestBody Kiroku kiroku) {
        return kirokuService.forVerify(kiroku);

    }


}
