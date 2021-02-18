package com.shop.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	BCryptPasswordEncoder passEncoder; //password 암호화(spring security)
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public int idCheck(@RequestParam("userId") String userId)throws Exception {
		return service.idCheck(userId);
	}
	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	public String mailCheck(String email)throws Exception{
		
		//view로부터 넘어온 데이터 확인
		logger.info("email data check");
		logger.info("인증번호 : " + email);
		
		//인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111; //111111 ~ 999999 범위의 숫자를 얻기위해
		logger.info("인증번호=" + checkNum);
		
		//이메일 보내기
		String setFrom = "sk985326@naver.com";				//root-context에 삽입한 자신의 이메일 계정의 이메일 주소
		String toMail = email; 								//수신받을 이메일. view로부터 받은 이메일 주소인 변수 email
		String title = "회원가입 인증 이메일 입니다.";				//내가 보낼 이메일의 제목
		String content = "이지현 쇼핑몰을 방문해주셔서 감사합니다." + 	//내가 보낼 이메일의 내용
						"<br><br>" +
						"인증번호는" + checkNum + "입니다." +
						"<br>" +
						"해당 인증번호를 확인란에 기입해주세요.";

		try {//MimeMessage(멀티파트 데이터 처리) 대신 SimpleMailMessage(단순 텍스트 데이터)를 사용할 수 있음 
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8"); //true는 멀티파트 메시지를 사용하겠다는 의미
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true); //true는 html을 사용하겠다는 의미
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum); //int type => String
		return num; //<- ajax 의 data
	}
	
}
