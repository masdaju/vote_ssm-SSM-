package edu.example.service;

import edu.example.dao.KirokuDao;
import edu.example.entity.Kiroku;
import edu.example.entity.Naiyou;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KirokuService {
    @Autowired
    KirokuDao kirokuDao;

    public boolean forVerify(Kiroku kiroku){
        System.out.println(kiroku);
        return kirokuDao.forVerify(kiroku);
    }
    public List<Kiroku> selectkiroku(){
        return kirokuDao.selectkiroku();
    }

    public  int deleteK(Kiroku kiroku){
        System.out.println(kiroku);
        return kirokuDao.deleteK(kiroku);
    }

}
