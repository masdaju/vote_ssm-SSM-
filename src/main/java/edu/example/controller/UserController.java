package edu.example.controller;

import edu.example.entity.Naiyou;
import edu.example.entity.User;
import edu.example.service.UserService;
import edu.example.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
    @RequestMapping("/UsersManage")
public class UserController {
    @Autowired
    private UserService userService;

    //用户管理//查询所有
    @RequestMapping("/Users")
//    public String UserManage(Model model){
//        List<User> userList = userService.SelectUserList();
//        model.addAttribute("userList",userList);
//        return "tuser";
//    }
    public ModelAndView UserManage() {
        List<User> userList = userService.SelectUserList();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("tuser");
        return modelAndView;
    }
    //查询单个通过Uid
    @RequestMapping("selectUid/{uid}")
    public String selectUid(@PathVariable("uid") int uid, Model model){
        List<User> user =userService.SelectUserUid(uid);
        model.addAttribute("userList", user);
        System.out.println(model);
        return "tuser";
    }
    //用户更新
    @PostMapping("/updateUser")
    @ResponseBody
    public boolean UpdateUser(@RequestBody User user){
        String encrypted = MD5Utils.md5(user.getPassword());
        user.setPassword(encrypted);
        if(userService.UpdateUser(user)>0){
            return true;
        }
        return false;
    }
    //删除用户
    @PostMapping("/deleteUser")
    @ResponseBody
    public boolean deleteUser(@RequestBody User user){
        return userService.deleteUser(user.getUid()) > 0;
    }
    @PostMapping("/activeUser")
    @ResponseBody
    public boolean activeUser(@RequestBody User user){
        return userService.activeUser(user.getUid()) > 0;
    }
    //重置密码
    @PostMapping("/resetPw")
    @ResponseBody
    public boolean resetPw(@RequestBody User user){
        if (userService.resetPw(user.getUid())>0){
            return true;
        }
        return false;
    }
    //增加用户
    @PostMapping("/addUser")
    @ResponseBody
    public boolean addUser(@RequestBody User user){
        String encrypted = MD5Utils.md5(user.getPassword());
        user.setPassword(encrypted);
        if(userService.addUser(user)>0){
            return true;
        }
        return false;
    }
    //注册
    @PostMapping("/doRegister")
    @ResponseBody
    public boolean doRegister(@RequestBody User user) {
        System.out.println(user);
        user.setPassword(MD5Utils.md5(user.getPassword()));
        if(userService.doRegister(user)>0){
            return true;
        }
        return false;
    }
    //删除用户
    @PostMapping("/deleteU")
    @ResponseBody
    //直接退出到主页面
    public boolean deleteU(@RequestBody User user){
        if(userService.deleteU(user.getUid())>0) {
            return true;
        }
        return false;
    }
    @RequestMapping("/logout2")
    public String Logout(HttpSession session){
        if (session != null) {
            // 使session失效
            session.invalidate();
        }
        return "redirect:/Login";

    }
    //查看用户详情
    @RequestMapping("uProfile/{username}")
    public String profile(@PathVariable("username") String username, Model model){
        System.out.println(username);
        User user = userService.profile(username);
        model.addAttribute("user", user);
        System.out.println(model);
        return "profile";
    }

}
