package com.office.flight.user.member;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/member")
public class UserMemberController {

	@Autowired
    private UserMemberService userMemberService;
	
	// 회원가입 페이지로 이동
    @GetMapping("/memberJoinForm")
    public String showMemberJoinPage(Model model) {
    	System.out.println("[UserMemberController] showMemberJoinPage");
        return "user/member/memberJoinForm"; // memberJoinForm.jsp를 반환
    }

    // 회원가입 처리
    @PostMapping("/join")
    public String joinMember(@ModelAttribute UserMemberVo member, Model model) {
    	
    	System.out.println("[UserMemberController] joinMember");
    	
    	// 비밀번호 확인
    	if (!member.getPassword().equals(member.getPasswordConfirm())) {
            model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
            return "user/member/memberJoinForm"; // 비밀번호 불일치 시 가입 페이지로 돌아감
        }
    	
        // 회원가입 서비스 호출
        boolean success = userMemberService.registerMember(member);
        
        if (success) {
            model.addAttribute("message", "회원가입 성공!");
            return "user/home"; // 성공 시 로그인 페이지로 리디렉션
        } else {
            model.addAttribute("message", "회원가입 실패. 다시 시도해 주세요.");
            return "user/member/memberJoinForm"; // 실패 시 가입 페이지로 돌아감
        }
    }
    
    @PostMapping("/login")
    public String loginMember(@RequestParam("id") String id,
                              @RequestParam("password") String password,
                              Model model) {    	
    	
    	System.out.println("[UserMemberController] loginMember");
    	
        // 로그인 서비스 호출
        Optional<UserMemberVo> member = userMemberService.loginMember(id, password);

        // 로그인 성공 여부에 따른 처리
        if (member.isPresent()) {
            model.addAttribute("member", member.get()); // 로그인한 회원 정보를 모델에 저장
            return "user/home";  // 로그인 성공 후 홈 페이지로 리디렉션
        } else {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 잘못되었습니다.");
            return "user/member/memberJoinForm"; // 로그인 실패 시 로그인 페이지로 돌아감
        }
    }   

}