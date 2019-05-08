package kr.goott.gymcarry.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/terms/*")
public class TermsController {
	final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="terms.do")
	public String conTerms() {
		return "terms/terms";
	}
	
	@RequestMapping(value="privacy.do")
	public String conPrivacy() {
		return "terms/privacy";
	}
}
