package com.bookshop.frontadvertise.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop.advertise.bean.AdvertiseDTO;
import com.bookshop.advertise.service.IAdvertiseService;
@Controller
@RequestMapping("/frontadvertise")
public class FrontAdvertiseController {
	private IAdvertiseService advertiseService;
	private final static int PAGE_SIZE = 5;
	@Autowired
	public void setAdvertiseService(IAdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}
	@RequestMapping("/adshow")
	public String queryAdvertise(Integer id,Model model) {
		AdvertiseDTO advertise = advertiseService.queryAdvertiseById(id);
		model.addAttribute("advertise", advertise);
		return "front/publicdetails";
	}
	
	
	@RequestMapping("/adlist")
	public String queryAdvertiseList(Integer pageno,Model model){
		if(pageno==null){
			pageno=1;
		}
		model.addAttribute("pageno", pageno);
		pageno = (pageno-1)*PAGE_SIZE;
		List<AdvertiseDTO> advertiseList = advertiseService.queryAdvertiseListByPage(pageno);
		model.addAttribute("advertiseList", advertiseList);
		int count = advertiseService.queryAdvertiseCount();
		int temp = count%PAGE_SIZE;
		int totalPage = 0;
		if(temp==0){
			totalPage = count/PAGE_SIZE;
		}else{
			totalPage = count/PAGE_SIZE+1;
		}
		model.addAttribute("count", totalPage);
		return "front/public";
	}
	
	
}
