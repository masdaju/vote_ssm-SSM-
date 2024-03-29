package edu.example.dao;

import org.apache.ibatis.annotations.Param;
import edu.example.entity.Naiyou;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface NaiyouDao {
    List<Naiyou> selectVoteList();
    List<Naiyou> selectVoteById(int vid);
    //添加投票内容
    int insertVote(@Param("naiyou") Naiyou naiyou);
    //添加表数记录
    int addVoteT(int vid);
//    删除票数
    int deleteVoteByGid(int vid);
    int deleteTById(int vid);
    int UpdateNaiyou(@Param("naiyou") Naiyou naiyou);
    //终止投票
    int ceaseVote(int vid);
    Naiyou detail(int vid);
}
