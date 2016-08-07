package com.wenban.bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wenban.bbs.model.Reply;
import com.wenban.bbs.model.User;
import com.wenban.bbs.service.CategoryService;
import com.wenban.bbs.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyservice;
	@Autowired
	private CategoryService service;
	
	@RequestMapping("/reply")
	@ResponseBody
	public Reply insertIntoReply(Model model, HttpSession session,Reply reply) {
		model.addAttribute("categoryList", service.getCategorylist());
		User user=(User)session.getAttribute("user");
		if(user != null){
			reply.setUserId(user.getId());
		}
		System.out.println(reply.getDescs());
		replyservice.insertIntoReply(reply);
		
		return reply;
	}
}
