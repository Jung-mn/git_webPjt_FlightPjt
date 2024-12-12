package com.office.flight.user.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMemberController {
	
	// 회원가입 페이지로 이동
    @GetMapping("/memberJoin")
    public String showMemberJoinPage() {
        return "user/member/memberJoin"; // memberJoin.jsp를 반환
    }
    
    // 회원가입 페이지로 이동
    @GetMapping("/memberLogin")
    public String showMemberLoginPage() {
        return "user/member/memberLogin"; // memberJoin.jsp를 반환
    }

}
