package com.file.board.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Autowired
	private SqlSessionFactory ssf;
	
	@RequestMapping("/")
	public String goHome(Model model) {
		SqlSession ss = ssf.openSession();
		System.out.println(ss);
		model.addAttribute("msg","Hello~");
		return "index";
	}
}
