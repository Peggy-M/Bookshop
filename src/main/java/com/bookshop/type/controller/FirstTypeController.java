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

import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.service.IFirstTypeService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/type")
public class FirstTypeController {
	private IFirstTypeService firstTypeService;
	private final static int PAGE_SIZE = 8;
	
	@Autowired
	public void setFirstTypeService(IFirstTypeService firstTypeService) {
		this.firstTypeService = firstTypeService;
	}
	
	/**分页查询一级类目并显示
	 * @param pageno
	 * @param model
	 * @return
	 */
	@RequestMapping("/typelist.do")
	public String showFirstTypeList(Integer pageno,Model model) {
		if(pageno==null){
			pageno = 1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<FirstTypeDTO> firstTypeList = firstTypeService.getFirstTypeByPage(pageno);
		model.addAttribute("firstTypeList", firstTypeList);
		int count = firstTypeService.getFirstTypeCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/type/typefirst";
	}
	
	/**新增一级类目
	 * @param firstType
	 * @param model
	 * @return
	 */
	@RequestMapping("/add.do")
	public String addFirstType(FirstTypeDTO firstType,Model model){
		firstTypeService.addFirstType(firstType);
		List<FirstTypeDTO> firstTypeList = firstTypeService.getFirstTypeByPage(0);
		model.addAttribute("firstType", firstType);
		model.addAttribute("firstTypeList", firstTypeList);
		return "background/type/typefirst";
	}
	
	@RequestMapping("/getTypeInfo.do")
	@ResponseBody
	public void getUpdateTypeInfo(Integer id,HttpServletResponse response) {
		FirstTypeDTO firstType = firstTypeService.queryFirstTypeById(id);
		Gson gson = new Gson();
		String json = gson.toJson(firstType);
		response.setContentType("text/html;charset=UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String updateFirstType(FirstTypeDTO firstType,Integer id){
		firstType.setTypeId(id);
		firstTypeService.updateFirstType(firstType);
		return "success";
	}
	@RequestMapping("/delete.do")
	public String deleteFirstType(Integer typeId,Model model) {
		firstTypeService.deleteFirstType(typeId);
		List<FirstTypeDTO> firstTypeList = firstTypeService.getFirstTypeByPage(0);
		model.addAttribute("firstTypeList", firstTypeList);
		return "background/type/typefirst";
	}
}
