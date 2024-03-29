package edu.example.dao;

import edu.example.entity.Kiroku;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

public interface KirokuDao {
    //验证
    boolean forVerify(@Param("kiroku") Kiroku kiroku);
    List<Kiroku> selectkiroku();

     int deleteK(@Param("kiroku") Kiroku kiroku);



}
