package edu.example.service;

import edu.example.dao.NaiyouDao;
import edu.example.entity.Naiyou;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class NaiyouService {
    @Autowired
    private NaiyouDao naiyouDao;
    //查询全部投票
public List<Naiyou> selectNaiyou(){
    return naiyouDao.selectVoteList();
}
    public List<Naiyou> selectNaiyouById(int vid){
        return naiyouDao.selectVoteById(vid);
    }
//终止投票
public int invalidateV(int vid){
    return naiyouDao.ceaseVote(vid);
}
//添加内容+和票
    public int insertNaiyou(Naiyou naiyou){

        if(naiyouDao.insertVote(naiyou)>0){
            return naiyouDao.addVoteT(naiyou.getVid());
        }
        return 0;
    }
    //更新内容+和票
    public int UpdateNaiyou(Naiyou naiyou){
        return naiyouDao.UpdateNaiyou(naiyou);
    }

    public int deleteNaiyouAndT(int vid){
    if (naiyouDao.deleteVoteByGid(vid)>0){
        return naiyouDao.deleteTById(vid);
    }
    return 0;
    }

    public Naiyou seletedetail(int vid){
    return naiyouDao.detail(vid);
    }

}
