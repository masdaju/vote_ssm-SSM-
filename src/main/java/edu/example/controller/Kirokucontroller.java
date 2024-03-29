package edu.example.controller;

import edu.example.entity.Kiroku;
import edu.example.entity.User;
import edu.example.service.KirokuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/KirokuManage")
public class Kirokucontroller {
    @Autowired
    KirokuService kirokuService;
//    查询使用投票记录
    @RequestMapping("/Kiroku")
    public String kiroku(Model model){
        List<Kiroku> kirokuList = kirokuService.selectkiroku();
        model.addAttribute("kirokuList",kirokuList);
        return "tKiroku";
    }
    @PostMapping("/deleteK")
    @ResponseBody
    //删除投票记录
    public boolean deleteK(@RequestBody Kiroku kiroku){
        if (kirokuService.deleteK(kiroku)>0){
            return true;
        }
        return false;
    }

}
