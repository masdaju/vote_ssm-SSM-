package edu.example.dao;

import edu.example.entity.Naiyou;
import org.apache.ibatis.annotations.Param;
import edu.example.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    //登录
    User UserLogin(@Param("userName") String userName,@Param("password") String password);
    //查询所有
    List<User> SelectUserList();
    //查询单个
    List<User> SelectUserUid(int uid);
    //用户更新
    int UpdateUser(@Param("user") User user);
    //删除用户
    int deleteUser(int uid);
    int activeUser(int uid);
    //重置密码
    int resetPw(int uid);

    //增加用户
    int addUser(@Param("user") User user);
    int deleteU(int uid);
    int Register(@Param("user") User user);
    User SelectUsername(String username);

}
