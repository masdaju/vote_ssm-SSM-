package edu.example.controller;

import edu.example.entity.Provider;
import edu.example.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProviderController {
    @Autowired
    ProviderService providerService;
    @RequestMapping("provider")
    public ModelAndView provider(){
        List<Provider> list = providerService.selects();
        ModelAndView modelAndView= new ModelAndView();
        modelAndView.addObject("list",list);
        modelAndView.setViewName("test");
        return modelAndView;
    }
//219970113李佳豪
    @RequestMapping("delete")
    public Boolean delete(@RequestBody int id){
        if (providerService.delete(id)>0){
            return true;
        }
        return false;
    }
    @RequestMapping("proDetail/{id}")
    public ModelAndView detail(@PathVariable int id){
        ModelAndView m =new ModelAndView();
        List<Provider> list =providerService.selectById(id);
        m.addObject("lsit",list);
        m.setViewName("test2");
        return m;
    }
    @RequestMapping("addpro")
    public Boolean addpro(@RequestBody Provider provider){
        System.out.println(provider);
        if (providerService.addpro(provider)>0){
            return true;
        }
        return false;
    }
    @RequestMapping("update")
    public Boolean updete(@RequestBody Provider provider){
        if (providerService.update(provider)>0){
            return true;
        }
        return false;
    }
    @RequestMapping("toaddpro")
    public String toaddpro(){
        return "test3";
    }
}
