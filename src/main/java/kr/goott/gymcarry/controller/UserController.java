package kr.goott.gymcarry.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.goott.gymcarry.auth.NaverLoginBO;
import kr.goott.gymcarry.auth.TempKey;
import kr.goott.gymcarry.model.dao.UserDAOInterface;
import kr.goott.gymcarry.model.dao.CommunityDAO;
import kr.goott.gymcarry.model.dto.CommunityDTO;
import kr.goott.gymcarry.model.dto.UserDTO;

@Controller
@RequestMapping("/user/*")
public class UserController {
	final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserDAOInterface userDAO;
	@Inject
	NaverLoginBO naverLoginBO;	
	@Inject
	JavaMailSender mailSender; //메일 발송 객체
	@Inject
	CommunityDAO communityDAO;
	@Resource(name = "uploadPath2")	
	String uploadPath2;
	
	@RequestMapping(value = "userJoin.do")
	public ModelAndView userJoin(HttpSession session) {
		logger.info("userjoin page view...");
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
		return new ModelAndView("user/userJoin","url",naverAuthUrl);
	}

	@RequestMapping(value = "login.do")
	public ModelAndView userLogin(HttpSession session) {
		logger.info("userLogin page view...");
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", naverAuthUrl);
		mav.setViewName("user/userLogin");
		return mav;
	}
	
	@RequestMapping(value = "naverLogin.do")
	public ModelAndView naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws Exception{
		
		/* 네이버 아이디로 로그인 인증이 끝나면 callback 처리 과정에서 AccessToken을 발급 받을 수 있다.*/
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String naverAccessToken = oauthToken.getAccessToken();
		logger.info(oauthToken.toString());
		/* 발급 받은 AccessToken을 이용하여 현재 로그인한 네이버의 사용자 프로필 정보를 조회할 수 있다. */
		UserDTO naverUser = naverLoginBO.getUserProfile(oauthToken);
		naverUser.setNaverAccessToken(naverAccessToken);
		/* 네이버 사용자 프로필 정보를 이용하여 가입되어 있는 사용자를 DB에서 조회하여 가져온다. */
		UserDTO naverid = userDAO.naverIdCheck(naverUser);
		if(naverid!=null) { //기존 사용자가 존재하면 강제 로그인!
			session.setAttribute("userid", naverid.getUserid());
			session.setAttribute("username", naverid.getUsername());
			session.setAttribute("loginCheck", "Y");
			List<CommunityDTO> list = communityDAO.comList();
			logger.info(list.get(0).getComImage()+"==========");
			model.addAttribute("list", list);  //占쏙옙占� 커占승댐옙티 占쏙옙占쏙옙트
			return new ModelAndView("redirect:/");			
		}else {//아이디값이 null이면 아이디 생성해야지			
			return new ModelAndView("user/registerNaver", "naverUser", naverUser);
		}		
	}
	
	@RequestMapping(value ="naverRegister.do", method = RequestMethod.POST)
	public ModelAndView naverRegister(@ModelAttribute UserDTO dto) {
		logger.info("naverRegister -> registerDone page view...");
		int cnt = userDAO.insertNaverUser(dto);
			ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.addObject("userid", dto.getUserid());
			System.out.println(dto.getUserid());
			mav.setViewName("user/registerDone");
			return mav;
		}else {
			mav.setViewName("redirect:naverRegister.do");
			return mav;
		}
	}
	
	@RequestMapping(value = "loginChk.do", method = RequestMethod.POST)
	public ModelAndView userLoginChk(@ModelAttribute UserDTO dto, HttpSession session) {
		logger.info("loginCheck page view...");
		// 일치하면 이름이 넘어오고 틀리면 null이 넘어옴
		UserDTO dto2 = userDAO.loginCheck(dto);
		if (dto2!= null) { // 맞으면
			// 세션변수 등록
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("username", dto2.getUsername());
			session.setAttribute("loginCheck", "Y");
			session.setAttribute("log", "Y");
			return new ModelAndView("/home");
		}else {
			session.setAttribute("log", "N");
			return new ModelAndView("redirect:login.do");
		}
	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		logger.info("logout success...");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "registerEmail.do")
	public String emailLogin() {
		logger.info("registerEmail page view...");
		return "user/registerEmail";
	}

	@RequestMapping(value = "direct.do", method = RequestMethod.POST)
	public ModelAndView registerEmail(@ModelAttribute UserDTO dto) {
		logger.info("registerDone page view...");
		userDAO.insertUser(dto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", dto.getUserid());
		System.out.println(dto.getUserid());
		mav.setViewName("user/registerDone");
		return mav;
	}

	// 멋쟁이 윤성이 
	@RequestMapping(value = "myProfile.do", method = RequestMethod.GET)
	public ModelAndView myProfile(HttpSession session) {
		logger.info("myprofile page view...");

			UserDTO dto = new UserDTO();
			String userid = (String) session.getAttribute("userid");
			logger.info(userid+"-------------------------------------");
			dto = userDAO.userInfo(userid);
			
			return new ModelAndView("user/myProfile", "dto", dto);
	}
	@RequestMapping(value= "myProfileEdit.do", method=RequestMethod.POST)
	public String editProfile(HttpSession session, @ModelAttribute UserDTO userDTO ) {
		String userid = (String) session.getAttribute("userid");
		userDTO.setUserid(userid);		
		userDAO.updateUser(userDTO);
		return "redirect:myProfile.do";		
		
	}
	@RequestMapping(value="delete.do" ,method=RequestMethod.POST)
	public String deleteUser(HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		userDAO.deleteUser(userid);
		session.invalidate();
		return "redirect:/";
		
	}
	//윤성이 끝
	
	@RequestMapping(value = "regAddInfo.do")
	public ModelAndView regAddInfo(@RequestParam String userid) {
		logger.info("regAddInfo page view...");
		UserDTO dto = new UserDTO();
		System.out.println("reguserid=" + userid);
		dto = userDAO.userInfo(userid);
		return new ModelAndView("user/regAddInfo", "userDTO", dto);
	}


	@RequestMapping(value="regAddDone.do", method = RequestMethod.POST) public
	String regAddDone(@ModelAttribute UserDTO dto, Model model) {
	logger.info("regAddDone page view"); 
	logger.info(dto.toString());
	int cnt = userDAO.addInfoUser(dto);
		if(cnt==1) { 
			List<CommunityDTO> list = communityDAO.comList();
			logger.info(list.get(0).getComImage()+"==========");
			model.addAttribute("list", list);  //占쏙옙占� 커占승댐옙티 占쏙옙占쏙옙트
			return "/home";
		}
		else { 
			return "redirect:/regAddInfo"; 
			} 
	}
	
	@RequestMapping(value = "findId.do")
	public String findId() {
		logger.info("findId page view...");
		return "user/findId";
	}
	@RequestMapping(value = "findIdresult.do")
	public ModelAndView findIdSuccess(@ModelAttribute UserDTO dto) {
		logger.info("findIdresult page view");
		UserDTO userDto = userDAO.findId(dto);
		if(userDto!=null) {		
			userDto.setUsername(dto.getUsername());
			userDto.setUseremail(dto.getUseremail());
			return new ModelAndView("user/findIdSuccess","userDto",userDto);
		}else {
			UserDTO userDto2 = new UserDTO();
			userDto2.setUsername(dto.getUsername());
			userDto2.setUseremail(dto.getUseremail());
			return new ModelAndView("user/findIdFail","userDto",userDto2);
		}
	}
	@RequestMapping(value = "findPwd.do")
	public ModelAndView findPwd() {
		logger.info("findPwd page view...");
		return new ModelAndView("user/findPwd");
	}
	
	@RequestMapping(value="findPwdResult.do",method = RequestMethod.POST)
	public ModelAndView findPwd(@ModelAttribute UserDTO dto){
		logger.info("findPwdResult page view...");
		String createPwd = new TempKey().getKey(12, false);
		dto.setCreatePwd(createPwd);
		int cnt = userDAO.findPwd(dto);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			sendMail(dto);
			mav.addObject("userDto", dto);
			mav.setViewName("user/findPwdSuccess");
			return mav;
		}else {
			mav.addObject("userDto", dto);
			mav.setViewName("user/findPwdFail");
			return mav;
		}				
	}
	
	@RequestMapping(value="idcheck.do")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userid){
		int cnt = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		cnt = userDAO.idCheckCount(userid);
		map.put("cnt", cnt);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="changePImg.do", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public void  changeProfileImage(MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("originalName : "+ file.getOriginalFilename());
		logger.info("req="+req.getParameter("userid"));
		int cnt = 0;
		String userid = req.getParameter("userid");
		String savedName = file.getOriginalFilename();
		savedName = uploadFile(userid, savedName, file.getBytes());
		UserDTO userDto = new UserDTO();
		userDto.setUserid(userid);
		userDto.setUserimage(savedName);
		UserDTO userDto2 = new UserDTO();
		userDto2.setUserid(userid);
		userDto2 = userDAO.selectImg(userDto2);
		if(!userDto2.getUserimage().equals(savedName)) {
			File file2 = new File(uploadPath2,userDto2.getUserimage());
			if(!userDto2.getUserimage().equals("avatar.png")) {
				file2.delete();
			}
		}
		cnt = userDAO.updateImg(userDto);
	}
	
	private String uploadFile(String userid, String oriFilename, byte[] fileData) throws Exception {
		String savedName = userid+"_"+oriFilename;
		File target = new File(uploadPath2, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	private void sendMail(UserDTO userdto) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			msg.addRecipient(RecipientType.TO, new InternetAddress(userdto.getUseremail()));//이메일 수신자
			msg.addFrom(new InternetAddress[] {//이메일 발신자
				new InternetAddress("zbass9019@gmail.com", "GYM-CARRY ADMIN")
			});
			msg.setSubject("GYM-CARRY 비밀번호 안내입니다.", "UTF-8"); //이메일 제목
			msg.setText(new StringBuffer().append("<h1>임시 비밀번호 안내</h1>"
					+ "	<h3>"+userdto.getUsername()+"님의 임시비밀번호는 "+userdto.getCreatePwd()+"입니다. </h3>"
					+ "	<h3>임시 비밀번호로 로그인 하신 후 프로필 - 회원정보 변경에서 앞으로 사용하실 새 비밀번호로 반드시 변경해주세요.</h3>"
					+ "	<a href=\'http://localhost:9090/gymcarry/user/login.do\' style=\'display: inline-block; padding: 9px 30px 8px; border: 1px solid #aaa; color: #555;margin: 10px auto 0;text-decoration: none; border-radius: 100px;\'"
					+ " target=\'_blank\'" 
					+ ">로그인 하기</a>").toString(),"UTF-8","html");//이메일 본문
			mailSender.send(msg);//전송
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//////////////////////
	@RequestMapping(value="test.do")
	public String test() {
		return "user/userLogin2";
	}
}
