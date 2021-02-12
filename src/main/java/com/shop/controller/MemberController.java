package com.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.domain.MemberVO;
import com.shop.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
			
	@Autowired
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	//회원가입 get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET()throws Exception{
		logger.info("get Join");
	}
	
	//회원가입 POST
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO vo)throws Exception{
		logger.info("post Join");
		
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		service.Join(vo);
		return "redirect:/";
	}
	
	//로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET()throws Exception{
		logger.info("get login");
	}
	
	//로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr)throws Exception{
		logger.info("post login");
		
		MemberVO signin = service.login(vo);
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUserPass(), signin.getUserPass());
		//passMatch는 사용자가 입력한 패스워드와 DB에 저장된 패스워드를 비교해서 동일하면 true, 아니면 false를 반환
		if(signin != null && passMatch) {
			session.setAttribute("member", signin);
		}else {
			session.setAttribute("member", null); //session값을 제거하고
			rttr.addFlashAttribute("msg", false);	//는 특정 페이지로 이동될 때 msg의 값 false를 부여함
			return "redirect:/member/login";		//이게 특정 페이지.
		}
		return "redirect:/";
	}
	
	
	//로그아웃
	@RequestMapping(value = "/logout", method =RequestMethod.GET)
	public String logout(HttpSession session)throws Exception{
		logger.info("get logout");
		
		service.logout(session);
		return "redirect:/";
	}
}
