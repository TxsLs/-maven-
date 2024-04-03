package com.hbh.controller;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbh.entity.Product;
import com.hbh.service.imp.ProductServiceImp;


@Controller
@RequestMapping("/staff/flatform/product")
public class ProductController {
	@Autowired
	ProductServiceImp productServiceImp;
//	获取所有商品信息
	@RequestMapping("getlist")
	public String getlist(ModelMap model,
			@RequestParam(defaultValue="1",required=true,value="pn") Integer pn
			) {
		PageHelper.startPage(pn, 4);
		List<Product> products= productServiceImp.getlist();
		PageInfo<Product> pageInfo=new PageInfo<Product>(products);
		model.addAttribute("pageInfo", pageInfo);
		return "getlist";
		
	}
//	根据id查询单个商品信息
    @RequestMapping("/getpro")  
    public String getpro(String proid,HttpServletRequest request,Model model){  
        request.setAttribute("product", productServiceImp.selectByPrimaryKey(proid));
        model.addAttribute("product",productServiceImp.selectByPrimaryKey(proid));  
        return "getpro";  
    }
//    根据条件查询
    @RequestMapping("/getprobyparams")  
    public String getbyparams(HttpServletRequest request,Model model,@RequestParam(value="proid",required=false)String proid,
    		@RequestParam(value="supname",required=false)String supname,@RequestParam(value="pname",required=false)String pname,
    		@RequestParam(value="protype",required=false)String protype,@RequestParam(defaultValue="1",required=true,value="pn") Integer pn
    		){
    	PageHelper.startPage(pn, 100);
    	List<Product> products= productServiceImp.getbyparams(proid, supname, pname, protype);
    	PageInfo<Product> pageInfo=new PageInfo<Product>(products);
		model.addAttribute("pageInfo", pageInfo);
		return "getprobyparams";
    	
    	
        
    }
	@RequestMapping("editpro")
	public String editProduct(Product pro,HttpServletRequest request,Model model){
		model.addAttribute("product", productServiceImp.selectByPrimaryKey(pro.getProid()));
		return "editpro";
	}	
	@RequestMapping("updatepro")
	public String updatepro(Product product,HttpServletRequest request,Model model){  
    	if(productServiceImp.updateByPrimaryKey(product)) {
    		product=productServiceImp.selectByPrimaryKey(product.getProid());
    		model.addAttribute("product", product);
    		return "redirect:getlist"; 
    	}
    	return null;
         
    } 
    @RequestMapping("/deletepro")  
    public String deletetepro(String proid,HttpServletRequest request,Model model){  
    	productServiceImp.deleteByPrimaryKey(proid);
        return "redirect:getlist";  
    } 
//  跳转到增加页面
    @RequestMapping("/toaddpro")  
  public String toaddpro(){  
  	return "addpro";

  } 
    
    @RequestMapping("/insertpro")  
//    先判断数据库有没有，有就更新，没有就新增
    public String insertpro(Product product,HttpServletRequest request,Model model){  
    	if(null==productServiceImp.selectByPrimaryKey(product.getProid())) {
        	productServiceImp.insert(product);   
        	return "redirect:getlist";
    	}else {
    		request.setAttribute("msg", "新增失败，系统中存在该id的商品，请重新输入！");
    		return "addpro";
    	}
    } 
    @InitBinder
    protected void init(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
    
    @RequestMapping("/getproduct")  
    @ResponseBody
    public Product getproduct(String proid,HttpServletRequest request,Model model){  
        Product product= new Product();
        product=productServiceImp.selectByPrimaryKey(proid);
        return product;  
    }

	@GetMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) {

		List<Product> productList = productServiceImp.getlist();
		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			// 根据页面index 获取sheet页
			HSSFSheet sheet = wb.createSheet("商品信息");
			HSSFRow rowHead = sheet.createRow(0);
			rowHead.createCell(0).setCellValue("商品id");
			rowHead.createCell(1).setCellValue("商品名称");
			rowHead.createCell(2).setCellValue("售价");
			rowHead.createCell(3).setCellValue("进价");
			rowHead.createCell(4).setCellValue("生产日期");
			rowHead.createCell(5).setCellValue("'过期时间'");
			rowHead.createCell(6).setCellValue("'供应商名称'");
			rowHead.createCell(7).setCellValue("'商品类型'");
			rowHead.createCell(8).setCellValue("'计件方式'");
			rowHead.createCell(9).setCellValue("'备注'");
			int len = productList.size()+1;
			int vi = 1;
			for (Product product :productList){
				HSSFRow row = sheet.createRow(vi);
				for (int i = 0; i < len; i++) {
					// 创建HSSFRow对象

					// 创建HSSFCell对象 设置单元格的值
					row.createCell(0).setCellValue(product.getProid());
					row.createCell(1).setCellValue(product.getPname());
					row.createCell(2).setCellValue(product.getPrice());
					row.createCell(3).setCellValue(product.getInprice());
					row.createCell(4).setCellValue(product.getProdate());
					row.createCell(5).setCellValue(product.getReledate());
					row.createCell(6).setCellValue(product.getSupname());
					row.createCell(7).setCellValue(product.getProtype());
					row.createCell(8).setCellValue(product.getUnit());
					row.createCell(9).setCellValue(product.getMarks());
				}
				vi++;
			}

			// 输出Excel文件
			OutputStream output = response.getOutputStream();
			response.reset();
			response.setHeader("content-type", "application/octet-stream");
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + UUID.randomUUID() + ".xls");
			// 设置文件头
//				response.setHeader("Content-Disposition",
//						"attchement;filename=" + new String("人员信息.xls".getBytes("gb2312"));
//				response.setContentType("application/msexcel");
			wb.write(output);
			wb.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
}
