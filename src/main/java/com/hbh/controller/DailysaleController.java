package com.hbh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbh.entity.Dailysale;
import com.hbh.entity.Sale;
import com.hbh.service.imp.DailysaleServiceImp;
import com.hbh.service.imp.SaleServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage/flatform/dailysale")
public class DailysaleController {
	@Autowired
	DailysaleServiceImp dailysaleServiceImp;

	
	
//  跳转到增加页面
	
  /*@RequestMapping("/toadd")
  public String toadd(){  
  	return "adddailysale";

  } */
//  跳转到修改页面
    
//    @RequestMapping("/toupdate")
//	public String editSale(Sale sale,HttpServletRequest request,Model model){
//		model.addAttribute("sale", saleServiceImp.getbyid(sale.getSaleid()));
//		return "editSale";
//	}
//  先判断数据库有没有，有就更新，没有就新增
    
//    @RequestMapping("/insert")
//    public String insert(Sale sale,HttpServletRequest request,Model model){
//    	if(null==saleServiceImp.getbyid(sale.getSaleid())) {
//    		saleServiceImp.insert(sale);
//    	}else {
//    		saleServiceImp.update(sale);
//    	}
//    	return "redirect:getall";
//
//    }
//    删除
    
//    @RequestMapping("/delete")
//    public String delete(String saleid) {
//    	saleServiceImp.delete(saleid);
//    	return "redirect:getall";
//    }
//    修改
    
//    @RequestMapping("/update")
//    public String update(Sale sale,HttpServletRequest request,Model model){
//    	if(saleServiceImp.update(sale)) {
//    		sale=saleServiceImp.getbyid(sale.getSaleid());
//    		model.addAttribute("sale", sale);
//    		return "redirect:getall";
//    	}
//    	return null;
//    }
    
//    查询所有
    
    @RequestMapping("/getall")
    public String getall_cus(ModelMap model,
			@RequestParam(defaultValue="1",required=true,value="pn") Integer pn
			) {
		PageHelper.startPage(pn, 4);
		List<Dailysale> sales= dailysaleServiceImp.getall();
		PageInfo<Dailysale> pageInfo=new PageInfo<Dailysale>(sales);
		model.addAttribute("pageInfo", pageInfo);
		return "manager/getall_dailysale";
		
	}
//  查询单个
    
    @RequestMapping("/getbyid")
    public String getbyid(String id,HttpServletRequest request,Model model) {
        request.setAttribute("dailysale", dailysaleServiceImp.getbyid(id));
        model.addAttribute("dailysale",dailysaleServiceImp.getbyid(id));
        return "manager/getdailysale";
  		
  	}
	@RequestMapping("/getbyparams")
	public String getbyparams(HttpServletRequest request,Model model,@RequestParam(value="proid",required=false)String proid,
    		@RequestParam(value="pname",required=false)String pname,@RequestParam(defaultValue="1",required=true,value="pn") Integer pn
    		) {
		PageHelper.startPage(pn, 100);
		List<Dailysale> dailysale= dailysaleServiceImp.getbyparams(proid, pname,0);
		PageInfo<Dailysale> pageInfo=new PageInfo<Dailysale>(dailysale);
		model.addAttribute("pageInfo", pageInfo);
		return "manager/getdailysalebyparams";
		
	}

}
