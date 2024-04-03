package com.hbh.dao;

import com.hbh.entity.Dailysale;
import com.hbh.entity.DailysaleExample;
import com.hbh.entity.Sale;
import com.hbh.entity.SaleExample;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface DailysaleMapper {
    int deleteByPrimaryKey(String saleid);

    int insert(Dailysale record);


    List<Dailysale> selectByExample(DailysaleExample example);

    Dailysale selectByPrimaryKey(String saleid);

    boolean updateByPrimaryKey(Dailysale record);
    
    List<Dailysale> getbyparams(@Param("proid") String proid,@Param("pname")String pname, @Param("timestamp") long timestamp);
    
    @Select("select SUM(num) as num,pname from dailysale GROUP BY pname")
    List<Map<String,Object>> count();

}