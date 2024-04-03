package com.hbh.dao;

import com.hbh.entity.Ckin;
import com.hbh.entity.CkinExample;
import com.hbh.entity.Product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CkinMapper {
	
    int deleteByPrimaryKey(String inid);

    int insert(Ckin record);


    List<Ckin> selectByExample(CkinExample example);

    Ckin selectByPrimaryKey(String inid);

    boolean updateByPrimaryKey(Ckin record);
    
    List<Ckin> getbyparams(@Param("proid") String proid,@Param("inid")String inid,@Param("pname")String pname,@Param("indate")String indate );

    @Select("select SUM(sumprice) as sumprice,SUM(num) as num,pname from ckin where DATE_FORMAT(indate, '%Y-%m') = DATE_FORMAT(NOW(), '%Y-%m') GROUP BY pname")
    List<Map<String,Object>> count();
}