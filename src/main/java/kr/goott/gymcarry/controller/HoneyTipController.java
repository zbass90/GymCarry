package kr.goott.gymcarry.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class HoneyTipController{
	final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping("/honeyTip.do")
	public String honeyTip() {
		return "honeyTip/honeyTip1";
	}
	@RequestMapping("/honeyTip2.do")
	public String honeyTip2() {
		return "honeyTip/honeyTip2";
	}
	@RequestMapping("/honeyTip3.do")
	public String honeyTip3() {
		return "honeyTip/honeyTip3";
	}
	@RequestMapping("/honeyTip4.do")
	public String honeyTip4() {
		return "honeyTip/honeyTip4";
	}
	@RequestMapping("/honeyTip5.do")
	public String honeyTip5() {
		return "honeyTip/honeyTip5";
	}
}