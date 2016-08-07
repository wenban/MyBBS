package com.wenban.bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wenban.bbs.service.CategoryService;
import com.wenban.bbs.service.TopicService;

@Controller
public class DetailController {
	@Autowired
	private CategoryService service;
	@Autowired
	private TopicService topicservice;

	@RequestMapping("/gotodetail")
	public String category(Model model,Integer id) {
		model.addAttribute("categoryList", service.getCategorylist());
		model.addAttribute("onetopic",topicservice.selectOneTopic(id));
		return "detail";
	}
	
	
}
