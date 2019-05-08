package kr.goott.gymcarry.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.gymcarry.model.dao.CommunityDAO;
import kr.goott.gymcarry.model.dao.PartnerDAO;
import kr.goott.gymcarry.model.dto.CommunityDTO;
import kr.goott.gymcarry.model.dto.UserDTO;
@Controller 
public class PartnerController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	@Inject 
	PartnerDAO partnerDAO;
	@Inject 
	CommunityDAO communityDAO;

	@GetMapping(value="partner.do")
	public ModelAndView viewPartner(ModelAndView mav) {
		mav.setViewName("partner/partnerList"); 
		
		List<UserDTO> list = partnerDAO.getAllUser();
		List<CommunityDTO> comList =  communityDAO.comList();
		mav.addObject("list",list); 
		mav.addObject("comList",comList);
		return mav; 
	
	} 
	
	@GetMapping(value="partner/locationApply")
	public String applyPartner(@RequestParam("userLat") Double userLat, @RequestParam("userLong") Double userLong,HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		logger.info(userid);
		partnerDAO.applyPartner(userLat, userLong,userid);
		logger.info("partner apply success");
		
		return "redirect:/partner.do";
	}


}
