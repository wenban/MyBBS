package com.wenban.bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wenban.bbs.model.Topic;
import com.wenban.bbs.model.User;
import com.wenban.bbs.service.CategoryService;
import com.wenban.bbs.service.TopicService;

@Controller

public class TopicController {
	@Autowired
	private TopicService addservice;
	@Autowired
	private TopicService deleteservice;
	@Autowired
	private TopicService selectservice;
	@Autowired
	private CategoryService service;
	@Autowired
	private TopicService childtopicservice;
	
	

	@RequestMapping("/selectTopic")
	public String selectcategory(Model model, Integer Id) {
		model.addAttribute("categoryList", service.getCategorylist());
		model.addAttribute("selectTopicList", selectservice.selectTopicList(Id));
		return "mainlist";
	}
	
	@RequestMapping("/selectTopicListByTopicname")
	public String selectTopicListByTopicname(Model model, Topic topic) {
		model.addAttribute("categoryList", service.getCategorylist());
		model.addAttribute("selectTopicListByTopicname", selectservice.selectTopicListByTopicname(topic));
		return "mainlist";
	}
	
	@RequestMapping("/selectChildTopic")
	public String selectChildTopic(Model model, Integer Id) {
		model.addAttribute("categoryList", service.getCategorylist());
		model.addAttribute("selectChildTopicList", childtopicservice.selectChildTopicList(Id));
		return "mainlist";
	}

	@RequestMapping("/add")
	public String add(Model model,HttpSession session) {
		model.addAttribute("categoryList", service.getCategorylist());
		if((User)session.getAttribute("user")!= null){
		return "add";
		}else{
			return "redirect:gotologin";
		}
	}

	@RequestMapping("/addnewtopic")
	public String addnewtopic(Model model, Topic topic) {
		model.addAttribute("categoryList", service.getCategorylist());
		addservice.insertIntoTopic(topic);
		return "redirect:category";
	}

	@RequestMapping("/delete")
	public String delete(Model model, Integer deleteid) {
		model.addAttribute("categoryList", service.getCategorylist());
		deleteservice.deleteTopicById(deleteid);
		return "redirect:category";
	}

	
}
