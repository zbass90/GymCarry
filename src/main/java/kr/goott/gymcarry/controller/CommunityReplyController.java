package kr.goott.gymcarry.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.goott.gymcarry.model.dao.CommunityDAO;
import kr.goott.gymcarry.model.dao.CommunityReplyDAO;
import kr.goott.gymcarry.model.dto.CommunityReplyDTO;

@Controller
public class CommunityReplyController {

	@Inject
	CommunityReplyDAO communityReplyDao;
	@Inject
	CommunityDAO communityDAO;
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping(value="community/reply/{comNo}" ,method=RequestMethod.POST)
	public String insertReply(@PathVariable int comNo ,CommunityReplyDTO dto) {
		//logger.info("community reply called");
		//logger.info("userid="+dto.getUserid()+"comNo=="+dto.getComNo()+"REPLYdes="+dto.getReplyDes());
		communityReplyDao.insertReply(dto.getUserid(),dto.getReplyDes(),dto.getComNo());
		communityDAO.replyCount(comNo);
		return "redirect:/community/view/"+comNo;
	}
	
	@PostMapping("community/replyEdit")
	public String editReply(CommunityReplyDTO dto) {
		//logger.info("repyno=="+dto.getReplyNo()+"REPLYdes="+dto.getReplyDes());
		communityReplyDao.editReply(dto.getReplyDes(), dto.getReplyNo());
		return "redirect:/community/view/"+dto.getComNo();
	}
	
	@PostMapping("community/replyDelete")
	public String deleteReply(CommunityReplyDTO dto) {
		communityReplyDao.deleteReply(dto.getReplyNo());
		communityDAO.replyCountSub(dto.getComNo());
		return "redirect:/community/view/"+dto.getComNo();
	}
	
	
}
