package com.bookshop.type.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.bean.ThirdTypeDTO;
import com.bookshop.type.service.ISecondTypeService;
import com.bookshop.type.service.IThirdTypeService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/type3")
public class ThirdTypeController {
	private IThirdTypeService thirdTypeService;
	private ISecondTypeService secondTypeService;
	@Autowired
	public void setSecondTypeService(ISecondTypeService secondTypeService) {
		this.secondTypeService = secondTypeService;
	}

	private static final int PAGE_SIZE = 8;
	
	@Autowired
	public void setThirdTypeService(IThirdTypeService thirdTypeService) {
		this.thirdTypeService = thirdTypeService;
	}
	
	/**根据一级类目ID查询其下所有二级类目
	 * @param typeFirstId
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping("/thirdtype.do")
	public String showThirdTypeByFirstId(Integer typeSecondId,Model model) {
		
		List<ThirdTypeDTO> thirdTypes = thirdTypeService.queryThirdTypeById(typeSecondId);
		model.addAttribute("thirdTypes", thirdTypes);
		List<SecondTypeDTO> secondTypeList = secondTypeService.getAllSecondType();
		model.addAttribute("secondTypeList", secondTypeList);
		return "background/type/typethree";
	}
	
	
	@RequestMapping("/typelist.do")
	public String showThirdTypeList(Integer pageno,Model model) {
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno  = (pageno-1)*PAGE_SIZE;
		List<ThirdTypeDTO> thirdTypeList = thirdTypeService.getThirdTypeByPage(pageno);
		model.addAttribute("thirdTypeList", thirdTypeList);
		List<SecondTypeDTO> secondTypeList = secondTypeService.getAllSecondType();
		model.addAttribute("secondTypeList", secondTypeList);
		int count = thirdTypeService.getThirdTypeCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/type/typethird";
	}
	@RequestMapping("/add.do")
	public String addThirdType(ThirdTypeDTO thirdType,Model model) {
		thirdTypeService.addThirdType(thirdType);
		List<ThirdTypeDTO> thirdTypeList = thirdTypeService.getThirdTypeByPage(0);
		model.addAttribute("thirdTypeList", thirdTypeList);
		return "background/type/typethird";
	}
	@RequestMapping("/delete.do")
	public String deleteThirdType(Integer typeId,Model model) {
		thirdTypeService.deleteThirdType(typeId);
		List<ThirdTypeDTO> thirdTypeList = thirdTypeService.getThirdTypeByPage(0);
		model.addAttribute("thirdTypeList", thirdTypeList);
		return "background/type/typethird";
	}
	@RequestMapping("update.do")
	@ResponseBody
	public String updateThirdType(ThirdTypeDTO thirdType,Integer id) {
		thirdType.setTypeId(id);
		thirdTypeService.updateThirdType(thirdType);
		return "success";
	}
	
	@RequestMapping("/getTypeInfo.do")
	@ResponseBody
	public void getTypeInfo(Integer id ,HttpServletResponse response) {
		ThirdTypeDTO thirdType = thirdTypeService.getThirdTypeByThirdId(id);
		Gson gson = new Gson();
		String json = gson.toJson(thirdType);
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
