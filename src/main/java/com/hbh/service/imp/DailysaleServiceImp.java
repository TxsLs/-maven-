package com.hbh.service.imp;

import com.hbh.dao.CustomMapper;
import com.hbh.dao.DailysaleMapper;
import com.hbh.dao.KcxxMapper;
import com.hbh.dao.SaleMapper;
import com.hbh.entity.Custom;
import com.hbh.entity.Dailysale;
import com.hbh.entity.Kcxx;
import com.hbh.entity.Sale;
import com.hbh.service.IDailysaleService;
import com.hbh.service.ISaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DailysaleServiceImp implements IDailysaleService {
	@Autowired
	DailysaleMapper dailysaleMapper;
	@Autowired
	KcxxMapper kcxxMapper;
	@Autowired
	CustomMapper customMapper;

	@Override
	public int delete(String saleid) {
		return dailysaleMapper.deleteByPrimaryKey(saleid);
	}

	@Override
	public int insert(Dailysale record) {
		String id=record.getProid();
		Custom custom=new Custom();
		Kcxx kcxx=new Kcxx();
		kcxx=kcxxMapper.selectByPrimaryKey(id);
		int kcnum=kcxx.getNum();
		int salenum=record.getNum();
		int nownum=kcnum-salenum-kcnum;
		kcxx.setNum(nownum);
		kcxx.setPname(record.getPname());
		kcxx.setProid(record.getProid());
		kcxxMapper.updateByPrimaryKey(kcxx);
		return dailysaleMapper.insert(record);
	}

	public List<Dailysale> getall() {
		// TODO Auto-generated method stub
		return dailysaleMapper.selectByExample(null);
	}

	public Dailysale getbyid(String id) {
		// TODO Auto-generated method stub
		return dailysaleMapper.selectByPrimaryKey(id);
	}

	public boolean update(Dailysale record) {
		// TODO Auto-generated method stub
		return dailysaleMapper.updateByPrimaryKey(record);
	}

	public List<Dailysale> getbyparams(String proid, String pname, long timestamp) {
		// TODO Auto-generated method stub
		return dailysaleMapper.getbyparams(proid, pname,timestamp);
	}

	public List<Map<String, Object>> pieData() {
		List<Map<String,Object>> data =new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> listdata=dailysaleMapper.count();
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
