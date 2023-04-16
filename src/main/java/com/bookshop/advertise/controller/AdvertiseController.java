package com.bookshop.advertise.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop.advertise.bean.AdvertiseDTO;
import com.bookshop.advertise.service.IAdvertiseService;
@Controller
@RequestMapping("/advertise")
public class AdvertiseController {
	private IAdvertiseService advertiseService;
	private final static int PAGE_SIZE = 5;
	@Autowired
	public void setAdvertiseService(IAdvertiseService advertiseService) {
		this.advertiseService = advertiseService;
	}
	@RequestMapping("/adshow.do")
	public String queryAdvertise(Integer id,Model model) {
		AdvertiseDTO advertise = advertiseService.queryAdvertiseById(id);
		model.addAttribute("advertise", advertise);
		return "background/advertise/adshow";
	}
	@RequestMapping("/add.do")
	public String addAdvertise(AdvertiseDTO advertise,Model model) {
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatdate = simpleDateFormat.format(date);
		advertise.setAdPublishTime(creatdate);
		
		advertiseService.addAdvertise(advertise);
		List<AdvertiseDTO> advertiseList = advertiseService.queryAdvertiseListByPage(0);
		model.addAttribute("advertiseList", advertiseList);
		return "background/advertise/adlist";
	}
	
	@RequestMapping("/adlist.do")
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
		return "background/advertise/adlist";
	}
	@RequestMapping("/requestupdate.do")
	public String requestUpdate(Integer id,Model model) {
		AdvertiseDTO advertise = advertiseService.queryAdvertiseById(id);
		model.addAttribute("advertise", advertise);
		return "background/advertise/adupdate";
	}
	@RequestMapping("/update.do")
	public String updateAdvertise(AdvertiseDTO advertise,Model model,HttpServletRequest request) {
		String adId = request.getParameter("id");
		advertise.setAdId(Integer.valueOf(adId));
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatdate = simpleDateFormat.format(date);
		advertise.setAdPublishTime(creatdate);
		
		advertiseService.updateAdvertise(advertise);
		List<AdvertiseDTO> advertiseList = advertiseService.queryAdvertiseListByPage(0);
		model.addAttribute("advertiseList", advertiseList);
		return "background/advertise/adlist";
	}
	@RequestMapping("/delete.do")
	public String deleteAdvertise(Integer adId,Model model) {
		advertiseService.deleteAdvertise(adId);
		List<AdvertiseDTO> advertiseList = advertiseService.queryAdvertiseListByPage(0);
		model.addAttribute("advertiseList", advertiseList);
		return "background/advertise/adlist";
	}
	
}
