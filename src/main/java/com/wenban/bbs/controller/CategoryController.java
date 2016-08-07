package com.wenban.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wenban.bbs.model.Category;
import com.wenban.bbs.service.CategoryService;
import com.wenban.bbs.service.TopicService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;
	@Autowired
	private CategoryService childcategoryservice;
	@Autowired
	private TopicService isnullservice;

	@RequestMapping("/category")
	public String category(Model model) {
		model.addAttribute("categoryList", service.getCategorylist());
		model.addAttribute("topicList", isnullservice.selectalltopic());
		return "mainlist";

	}

	@RequestMapping("/category/load")
	@ResponseBody
	public List<Category> categoryload(Integer parentId) {
		List<Category> c = childcategoryservice.getChildCategorylist(parentId);
		System.out.println(c.get(0).getCateName());
		return c;
	}

}
