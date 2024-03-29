package edu.example.controller;

import edu.example.entity.Kiroku;
import edu.example.entity.User;
import edu.example.service.KirokuService;
import edu.example.service.UserService;
import edu.example.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes("user")
public class MController {
    @Autowired
    private UserService userService;
    @Autowired
    private KirokuService kirokuService;
    //登录页面跳转
    @RequestMapping("/Login")
    public String hello(){
        return "Login";
    }

//    @RequestMapping("layui")
//    public String test(){
//        return "test";
//    }
    //注册页面跳转
    @RequestMapping("Register")
    public String Rigister(){
        return "touroku";
    }

    //登录
    @PostMapping("/doAjaxLogin")
    @ResponseBody
    public int doLogin(@RequestBody User user, HttpSession session) {
//        System.out.println("controller");
//        System.out.println(user.getUserName() + user.getPassword());
        String encrypted = MD5Utils.md5(user.getPassword());
        User user1 = userService.UserLogin(user.getUserName(), encrypted);
//        System.out.println(user1.toString());

        if (user1 != null) {
            if (user1.getState()==1) {
                session.setAttribute("user", user1);
                return 1;
            }else {
                return 0;
            }
        }else {
            return 50;
        }
    }
    //跳转主页
    @RequestMapping("/index")
    public String hello1(){
        return "/index";
    }

    //跳转首页
    @RequestMapping("/zhuye")
    public String zhuye(){

        return "ind";
    }
//    @RequestMapping("/layui")
//    public String dasd(){
//        return "/test";
//    }
    //查询记录
    @RequestMapping("/kiroku")
    public String kiroku(Model model){
        List<Kiroku> kirokuList = kirokuService.selectkiroku();
        model.addAttribute("kirokuList",kirokuList);
        return "tKiroku";
    }
    //退出登录
    @RequestMapping("/logout")
    public String Logout(){
        return "texit";

    }
    @RequestMapping("/etime")
    public String times(){
        return "etime";

    }

}
