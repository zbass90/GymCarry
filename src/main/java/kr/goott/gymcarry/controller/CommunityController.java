package kr.goott.gymcarry.controller;
import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.goott.gymcarry.model.dao.CommunityDAO;
import kr.goott.gymcarry.model.dao.CommunityDAOInterface;
import kr.goott.gymcarry.model.dao.CommunityLikeDAO;
import kr.goott.gymcarry.model.dao.CommunityReplyDAO;
import kr.goott.gymcarry.model.dao.UserDAO;
import kr.goott.gymcarry.model.dto.CommunityDTO;
import kr.goott.gymcarry.model.dto.CommunityLikeDTO;
import kr.goott.gymcarry.model.dto.UserDTO;

@Controller
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Inject
	CommunityDAO communityDAO;
	@Inject 
	CommunityReplyDAO communityReplyDao;
	@Inject
	CommunityLikeDAO communityLikeDAO;
	@Inject
	UserDAO userDAO;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value = "community.do", method = RequestMethod.GET)
	public String community(Model model) {
		List<CommunityDTO> list = communityDAO.comList();
		model.addAttribute("uploadPath", "");
		model.addAttribute("list", list); 
		return "community/list";
	}
	
	
	



	  @RequestMapping(value="community/upload.do" , method=RequestMethod.POST)
	  public String insertCommunity(@RequestParam("comDes") String comDes ,HttpSession session ,  MultipartFile comImage)throws Exception {
		  logger.info(comDes);		  
		  logger.info("file name="+comImage.getOriginalFilename());
		  logger.info("file size="+comImage.getSize());
	      logger.info("content type="+comImage.getContentType()); 
		  
			String savedName = comImage.getOriginalFilename(); //
			savedName = uploadFile(savedName,comImage.getBytes());   //upload file at this time			
			CommunityDTO dto = new CommunityDTO();
			String userid = (String)session.getAttribute("userid");
			dto.setUserid(userid);
			dto.setComDes(comDes);
			dto.setComImage(savedName);
			
			communityDAO.insertCommunity(dto); 
		  return "redirect:/community.do"; 
	  }
	  
		public String uploadFile(String oriFilename, byte[] fileData)throws Exception{
			UUID uid = UUID.randomUUID();
			String savedName = uid.toString() +"_" + oriFilename;
			File target = new File(uploadPath,savedName);
			System.out.println("upload path==========="+uploadPath);
			FileCopyUtils.copy(fileData, target);
			
			return savedName;
		}
		
		public boolean deleteFile(String deleteFilename) {
			File file = new File(uploadPath,deleteFilename);
			return file.delete();
			
		}
	
		

		@RequestMapping(value= "community/view/{comNo}", method=RequestMethod.GET)
		public ModelAndView viewCommunity2(@PathVariable int comNo ,ModelAndView mav,HttpSession session) {
			CommunityDTO dto = communityDAO.viewCommunity(comNo); 
			mav.addObject("dto",dto);
			//get reply dto values
			
			
			
			mav.addObject("replyList",communityReplyDao.viewReply(comNo)); 
			//view count++
			communityDAO.viewCount(comNo);
	
			String userid = (String) session.getAttribute("userid"); 
			logger.info("userid=="+userid);
			mav.addObject("userid",userid); //login ID
			//check like
			int like = communityLikeDAO.checkLike(comNo,userid);
			mav.addObject("like",like);
			mav.setViewName("community/view");		
			return mav;
		}

		@RequestMapping(value= "community/edit/{comNo}", method=RequestMethod.POST)
		public String editCommunity(@PathVariable int comNo ,@RequestParam("comDes") String comDes,@RequestParam("priorImage") String priorImage,MultipartFile comImage) throws Exception {

			logger.info("file name="+comImage.getOriginalFilename());
			CommunityDTO dto = new CommunityDTO();
			
			dto.setComDes(comDes);
			dto.setComNo(comNo);
			if(comImage.getOriginalFilename()=="") {
				//when image doesnt changed
				dto.setComImage(priorImage);  //set prior image name 
			}else {
				//when image and text changed
				String savedName = comImage.getOriginalFilename(); //
				savedName = uploadFile(savedName,comImage.getBytes());   //upload file at this time
				dto.setComImage(savedName);				
			}			
			communityDAO.editCommunity(dto); 			
			return "redirect:/community/view/"+comNo;
			
		}
		
		@RequestMapping(value="community/delete/{comNo}" ,method=RequestMethod.POST)
		public String deleteCommunity(@PathVariable int comNo,@RequestParam("comImage") String comImage) {
			logger.info("delete community called");
			
			communityDAO.deleteCommunity(comNo);
			boolean bool= deleteFile(comImage);
			logger.info("delete? = "+ bool);
			return "redirect:/community.do";
			
		}
		
		@PostMapping(value="community/like/{comNo}")
		public String likeCount(@PathVariable int comNo,HttpSession session) {
			communityDAO.likeCount(comNo);
			String userid = (String) session.getAttribute("userid");
			communityLikeDAO.insertLike(comNo, userid);
			return "redirect:/community/view/"+comNo;
		}
		@PostMapping(value="community/unlike/{comNo}")
		public String unlikeCount(@PathVariable int comNo,HttpSession session) {
			communityDAO.likeCountSub(comNo);
			String userid = (String) session.getAttribute("userid");
			communityLikeDAO.deleteLike(comNo, userid);
			return "redirect:/community/view/"+comNo;
		}	
		
		@RequestMapping(value= "community/prof/{userid}", method=RequestMethod.POST)
		public ModelAndView prof(@PathVariable String userid ,ModelAndView mav) {
			UserDTO dto = new UserDTO();
			dto = userDAO.userInfo(userid);
			mav.addObject("dto",dto);			
			mav.setViewName("community/prof");		
			return mav;
		}

}

