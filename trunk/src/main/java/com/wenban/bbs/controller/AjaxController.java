package com.wenban.bbs.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wenban.bbs.model.Topic;

@Controller
public class AjaxController {
	@RequestMapping("/ajaxcontrol")
	@ResponseBody
	public List<Topic> category(Model model) {
		List<Topic> topicajax = new ArrayList<Topic>();
		for (int i = 1; i <= 10; i++) {
			Topic topic = new Topic();
			topic.setCategoryId(i);
			topic.setName("name" + i);
			topicajax.add(topic);
		}

		return topicajax;

	}
}
