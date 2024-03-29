package edu.example.controller;

import edu.example.entity.Naiyou;
import edu.example.entity.User;
import edu.example.service.NaiyouService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/NaiyouManage")
public class NaiyouController {
    @Autowired
    private NaiyouService naiyouService;
    //查询所有投票
    @RequestMapping("/Naiyou")
    public String naiyou(Model model){
        List<Naiyou> naiyouList = naiyouService.selectNaiyou();
        model.addAttribute("naiyouList",naiyouList);
        return "tnaiyou";
    }
//删除投票
    @PostMapping("/deleteN")
    @ResponseBody
    public boolean deleteG(@RequestBody Naiyou naiyou){
        if (naiyouService.deleteNaiyouAndT(naiyou.getVid())>0){
            return true;
        }
        return false;
    }
    //新增投票
    @PostMapping("insertN")
    @ResponseBody
    public boolean insertN(@RequestBody Naiyou naiyou){
        if(naiyouService.insertNaiyou(naiyou)>0){
            return true;
        }
        return false;
    }
//    更新投票
    @PostMapping("updateN")
    @ResponseBody
    public boolean updateN(@RequestBody Naiyou naiyou){
        if(naiyouService.UpdateNaiyou(naiyou)>0){
            return true;
        }
        return false;
    }
    //查询单个通过vid
    @RequestMapping("selectVid/{vid}")
    public String selectVid(@PathVariable("vid") int vid, Model model){
        List<Naiyou> naiyouList =naiyouService.selectNaiyouById(vid);
        model.addAttribute("naiyouList", naiyouList);
        System.out.println(model);
        return "tnaiyou";
    }
}
