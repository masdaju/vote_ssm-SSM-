package edu.example.service;

import edu.example.dao.ProviderDao;
import edu.example.entity.Provider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProviderService {
    @Autowired
    ProviderDao providerDao;
    public List<Provider> selects(){return providerDao.select();}
    public List<Provider> selectById(int id){return providerDao.selectById(id);}
    public int addpro(Provider provider){return providerDao.addProvider(provider);}
    public int delete(int id){return providerDao.deleteById(id);}
    public int update(Provider provider){return providerDao.updateProvider(provider);}


}
