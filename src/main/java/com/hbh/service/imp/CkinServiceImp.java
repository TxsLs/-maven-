package com.hbh.service.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbh.dao.CkinMapper;
import com.hbh.entity.Ckin;
import com.hbh.entity.CkinExample;
import com.hbh.entity.Product;
import com.hbh.service.ICkinService;

@Service
public class CkinServiceImp implements ICkinService{
	@Autowired
	CkinMapper ckinMapper;

	public int delete(String inid) {
		// TODO Auto-generated method stub
		return ckinMapper.deleteByPrimaryKey(inid);
	}

	public int insert(Ckin record) {
		// TODO Auto-generated method stub
		return ckinMapper.insert(record);
	}

	public List<Ckin> getall() {
		// TODO Auto-generated method stub
		return ckinMapper.selectByExample(null);
	}

	public Ckin getbyid(String inid) {
		// TODO Auto-generated method stub
		return ckinMapper.selectByPrimaryKey(inid);
	}

	public boolean update(Ckin record) {
		// TODO Auto-generated method stub
		return ckinMapper.updateByPrimaryKey(record);
	}

	public List<Ckin> getbyparams(String proid, String inid, String pname, String indate) {
		// TODO Auto-generated method stub
		return ckinMapper.getbyparams(proid, inid, pname, indate);
	}

	public List<Map<String, Object>> pieData() {
		List<Map<String,Object>> data =new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> listdata=ckinMapper.count();
		if(listdata.size()>0){
			for(int i=0;i<listdata.size();i++){
				Map<String,Object> map=new HashMap<String, Object>();
				map.put("name", listdata.get(i).get("pname"));
				map.put("value", listdata.get(i).get("num"));
				data.add(map);
			}
		}
		return data;
	}


}
