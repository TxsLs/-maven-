package com.hbh.service.imp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.hbh.dao.DailysaleMapper;
import com.hbh.entity.Dailysale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbh.dao.CustomMapper;
import com.hbh.dao.KcxxMapper;
import com.hbh.dao.SaleMapper;
import com.hbh.entity.Custom;
import com.hbh.entity.Kcxx;
import com.hbh.entity.Sale;
import com.hbh.service.ISaleService;
@Service
public class SaleServiceImp implements ISaleService {
	@Autowired
	SaleMapper saleMapper;
	@Autowired
	KcxxMapper kcxxMapper;
	@Autowired
	CustomMapper customMapper;
	@Autowired
	DailysaleMapper dailysaleMapper;

	@Override
	public int delete(String saleid) {
		return saleMapper.deleteByPrimaryKey(saleid);
	}

	@Override
	public int insert(Sale record) throws ParseException {
		String id=record.getProid();
		String cusid=record.getCusid();
		String name=record.getCusname();
		Custom custom=new Custom();
		if(customMapper.getbyparams(cusid, name).size()==0) {
			custom.setCusid(cusid);
			custom.setCusname(name);
			if(record.getTotal()>500) {
				int a=customMapper.insert(custom);
				}
			}else {
				customMapper.updateByPrimaryKey(custom);
			}
		Kcxx kcxx=new Kcxx();
		kcxx=kcxxMapper.selectByPrimaryKey(id);
		int kcnum=kcxx.getNum();
		int salenum=record.getNum();
		int nownum=kcnum-salenum-kcnum;
		kcxx.setNum(nownum);
		kcxx.setPname(record.getPname());
		kcxx.setProid(record.getProid());
		kcxx.setMarks(record.getMarks());
		kcxxMapper.updateByPrimaryKey(kcxx);

		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(currentDate);
		long timestamp = dateFormat.parse(formattedDate).getTime();

		// 销售增加，每日销售单入库数据
		Dailysale dailysale = new Dailysale();
		// 根据时间和商品id查询数据库是否有数据，有数据，只增价格，无数据，新增
		List<Dailysale> dailysaleList = dailysaleMapper.getbyparams(record.getProid(),record.getPname(),timestamp);
		if(dailysaleList.size()>0){
			Dailysale dailysale1 = dailysaleList.get(0);
			dailysale.setId(dailysale1.getId());
			Double price = dailysale1.getPrice();
			Double price1 = record.getTotal();
			double sumprice = price + price1;

			dailysale.setProid(dailysale1.getProid());
			dailysale.setCreatetime(formattedDate);
			dailysale.setPname(dailysale1.getPname());
			dailysale.setNum(dailysale1.getNum()+record.getNum());
			dailysale.setPrice(sumprice);
			dailysale.setTimestamp(timestamp);
			dailysaleMapper.updateByPrimaryKey(dailysale);
		}else{
			Random rand=new Random();//生成随机数
			String cardNnumer="";
			for(int a=0;a<3;a++){
				cardNnumer+=rand.nextInt(10);//生成3位数字
			}

			dailysale.setId(Integer.valueOf(cardNnumer));
			dailysale.setNum(record.getNum());
			dailysale.setPname(record.getPname());
			dailysale.setProid(record.getProid());
			dailysale.setCreatetime(formattedDate);
			dailysale.setPrice(record.getTotal());
			dailysale.setTimestamp(timestamp);
			dailysaleMapper.insert(dailysale);
		}
//		dailysale.setNum();
		return saleMapper.insert(record);
	}

	public List<Sale> getall() {
		// TODO Auto-generated method stub
		return saleMapper.selectByExample(null);
	}

	public Sale getbyid(String saleid) {
		// TODO Auto-generated method stub
		return saleMapper.selectByPrimaryKey(saleid);
	}

	public boolean update(Sale record) {
		// TODO Auto-generated method stub
		return saleMapper.updateByPrimaryKey(record);
	}

	public List<Sale> getbyparams(String proid, String cusid, String pname, String cusname) {
		// TODO Auto-generated method stub
		return saleMapper.getbyparams(proid, cusid, pname, cusname);
	}

	public List<Map<String, Object>> pieData() {
		List<Map<String,Object>> data =new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> listdata=saleMapper.count();
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
