package edu.example.service;

import edu.example.dao.UserDao;
import edu.example.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;
    //登录
    public User UserLogin(String userName,String password){
        return userDao.UserLogin(userName,password);
    }
    //查询所有
    public List<User> SelectUserList(){
        return userDao.SelectUserList();
    }
    //查询单个
    public List<User> SelectUserUid(int uid){
        return userDao.SelectUserUid(uid);
    }
    //用户更新
    public int UpdateUser(User user){
        return userDao.UpdateUser(user);
    }
    //删除用户
    public int deleteUser(int uid){
        return userDao.deleteUser(uid);
    }
    //重置密码
    public int resetPw(int uid){
        return userDao.resetPw(uid);
    }
    //增加用户
    public int addUser(User user){
        return userDao.addUser(user);
    }
    public int deleteU(int uid){
        return userDao.deleteU(uid);
    }
    public int doRegister(User user){

        return userDao.Register(user);
    }
    public User profile(String username){
        return userDao.SelectUsername(username);
    }
}
