package edu.example.dao;

import edu.example.entity.Provider;
import org.apache.ibatis.annotations.Param;

import java.util.List;
//21997013
public interface ProviderDao {
    List<Provider> select();
    List<Provider> selectById(int id);
    int deleteById(int id);
    int addProvider(@Param("provider") Provider provider);
    int updateProvider(@Param("provider") Provider provider);
}
