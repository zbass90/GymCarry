package kr.goott.gymcarry.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.gymcarry.model.dao.NoticeDAO;
import kr.goott.gymcarry.model.dto.NoticeDTO;




@Controller
public class NoticeController{
	final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	NoticeDAO noticeDAO;
	NoticeDTO noticeDTA;
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value = "notice.do", method= RequestMethod.GET)
	public String notice(Model model) {
		logger.info("notice Mapping go");
		List<NoticeDTO> list = noticeDAO.noticeList();

		model.addAttribute("list", list);
		
		logger.info("notice Mapping get");
		return "notice/notice";
	}
	
	
	@RequestMapping(value= "notice/view/{noticeno}", method=RequestMethod.GET)
	public ModelAndView viewNotice(@PathVariable int noticeno ,ModelAndView mav) {
		logger.info("==========noticeno="+noticeno);
		
		NoticeDTO dto = noticeDAO.viewNotice(noticeno); 
		
		mav.addObject("dto",dto);

		mav.setViewName("notice/view");
	
		return mav;
	}
	@RequestMapping(value="notice/submit.do" , method=RequestMethod.POST)
	  public String insertNotice(@RequestParam("des") String des , @RequestParam("title") String title )throws Exception {
		  System.out.println("========================");
		  logger.info(des);
		  logger.info(title);
		  
			NoticeDTO dto = new NoticeDTO();
			
			dto.setDes(des);
			dto.setTitle(title);
			
			noticeDAO.submitNotice(dto); 
 
		  return "redirect:/notice.do"; 
	  }
	
	@RequestMapping(value= "notice/edit/{noticeno}", method=RequestMethod.POST)
	public String editNotice(@PathVariable int noticeno ,@RequestParam("des") String des, @RequestParam("title") String title) throws Exception {
		NoticeDTO dto = new NoticeDTO();
		logger.info("=====des"+des);
		
		dto.setNoticeno(noticeno);
		dto.setTitle(title);
		dto.setDes(des);
		
		noticeDAO.editNotice(dto); 			
		return "redirect:/notice/view/"+noticeno;
		
	}
	
	@RequestMapping(value="notice/delete/{noticeno}" ,method=RequestMethod.POST)
	public String deleteNotice(@PathVariable int noticeno) {
		logger.info("delete notice called");
		noticeDAO.deleteNotice(noticeno);
		return "redirect:/notice.do";
		
	}
	
}