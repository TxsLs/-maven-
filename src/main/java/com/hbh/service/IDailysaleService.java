package com.hbh.service;

import com.hbh.entity.Dailysale;
import com.hbh.entity.Sale;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IDailysaleService {
	
	int delete(String saleid);

    int insert(Dailysale record);


    List<Dailysale> getall();

    Dailysale getbyid(String saleid);

    boolean update(Dailysale record);
    
    List<Dailysale> getbyparams(String proid, String pname, long timestamp);
    public List<Map<String,Object>> pieData();

}
