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
import com.bookshop.type.bean.SecondTypeDTO;
import com.bookshop.type.service.IFirstTypeService;
import com.bookshop.type.service.ISecondTypeService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/type2")
public class SecondTypeController {
	private ISecondTypeService secondTypeService;
	private IFirstTypeService firstTypeService;
	private final static int PAGE_SIZE = 8;
	@Autowired
	public void setSecondTypeService(ISecondTypeService secondTypeService) {
		this.secondTypeService = secondTypeService;
	}
	
	@Autowired
	public void setFirstTypeService(IFirstTypeService firstTypeService) {
		this.firstTypeService = firstTypeService;
	}


	/**根据一级类目ID查询其下所有二级类目
	 * @param typeFirstId
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping("/secondtype.do")
	public String showSecondTypeByFirstId(Integer typeFirstId,Model model) {
		
		List<SecondTypeDTO> secondTypes = secondTypeService.querySecondTypeById(typeFirstId);
		model.addAttribute("secondTypes", secondTypes);
		List<FirstTypeDTO> firstTypeList = firstTypeService.getAllFirstType();
		model.addAttribute("firstTypeList", firstTypeList);
		return "background/type/typetwo";
	}
	
	/**分页查询所有二级类目名称
	 * @param pageno
	 * @param model
	 * @return
	 */
	@RequestMapping("/typelist.do")
	public String showSecondTypeList(Integer pageno,Model model) {
		if(pageno==null){
			pageno=1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<SecondTypeDTO> secondTypeList = secondTypeService.getSecondTypeByPage(pageno);
		model.addAttribute("secondTypeList", secondTypeList);
		List<FirstTypeDTO> firstTypeList = firstTypeService.getAllFirstType();
		model.addAttribute("firstTypeList", firstTypeList);
		int count = secondTypeService.getSecondTypeCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage=count/PAGE_SIZE;
		}else {
			totalPage=count/PAGE_SIZE+1;
		}
		model.addAttribute("count",totalPage);
		return "background/type/typesecond";
	}
	
	/**新增二级类目
	 * @param secondType
	 * @param model
	 * @return
	 */
	@RequestMapping("/add.do")
	public String addSecondType(SecondTypeDTO secondType,Model model) {
		secondTypeService.addSecondType(secondType);
		List<SecondTypeDTO> secondTypeList = secondTypeService.getSecondTypeByPage(0);
		model.addAttribute("secondTypeList", secondTypeList);
		return "background/type/typesecond";
	}
	/**删除二级类目
	 * @param secondType
	 * @param model
	 * @return
	 */
	@RequestMapping("/delete.do")
	public String deleteSecondType(Integer typeId,Model model) {
		secondTypeService.deleteSecondType(typeId);
		List<SecondTypeDTO> secondTypeList = secondTypeService.getSecondTypeByPage(0);
		model.addAttribute("secondTypeList", secondTypeList);
		return "background/type/typesecond";
	}
	/**修改二级类目
	 * @param secondType
	 * @param model
	 * @return
	 */
	@RequestMapping("/update.do")
	@ResponseBody
	public String updateSecondType(SecondTypeDTO secondType,Integer id) {
		secondType.setTypeId(id);
		secondTypeService.updateSecondType(secondType);
		return "success";
	}
	
	@RequestMapping("/getTypeInfo.do")
	@ResponseBody
	public void getTypeInfo(Integer id ,HttpServletResponse response) {
		SecondTypeDTO secondType = secondTypeService.getSecondTypeBySecondTypeId(id);
		Gson gson = new Gson();
		String json = gson.toJson(secondType);
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
