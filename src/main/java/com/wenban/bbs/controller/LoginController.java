package com.wenban.bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wenban.bbs.model.User;
import com.wenban.bbs.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService registerservice;
	@Autowired
	private UserService loginservice;

	@RequestMapping("/gotologin")
	public String gotologin() {
		return "login";
	}

	@RequestMapping("/login")
	public String login(Model model, User user, HttpSession session) {
		User u = loginservice.selectlogin(user);
		if (u == null) {
			model.addAttribute("error1", "用户名不存在");
			return "login";
		} else if (!u.getLoginPasswd().equals(user.getLoginPasswd())) {
			System.out.println(u.getLoginPasswd());
			System.out.println(user.getLoginPasswd());
			model.addAttribute("error2", "密码错误");
			return "login";
		} else {
			session.setAttribute("user", u);
			System.out.println("login success");
			return "redirect:category";
		}

	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
			session.removeAttribute("userid");
			return "redirect:/category";
	}

	@RequestMapping("/gotoregister")
	public String gotoregister() {
		return "register";
	}

	@RequestMapping("/register")
	public String register(User user) {
		System.out.println(user.getName());
		registerservice.insertIntoUser(user);
		return "login";
	}
}
