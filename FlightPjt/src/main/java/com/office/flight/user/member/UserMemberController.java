package com.office.flight.user.member;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    
    
    // 로그인 페이지로 이동
    @GetMapping("/memberLoginForm")
    public String showMemberLoginPage(Model model) {
    	System.out.println("[UserMemberController] showMemberLoginPage");
        return "user/member/memberLoginForm"; // memberJoinForm.jsp를 반환
    }
    
    // 로그인 기능
    @PostMapping("/login")
    public String loginMember(@RequestParam("id") String id,
                              @RequestParam("password") String password,
                              Model model, HttpSession session) { 

        System.out.println("[UserMemberController] loginMember");

        // 로그인 서비스 호출
        Optional<UserMemberVo> member = userMemberService.loginMember(id, password);

        // 로그인 성공 여부에 따른 처리
        if (member.isPresent()) {
            // 로그인 성공 시, 세션에 사용자 정보 저장
            session.setAttribute("loggedInUser", member.get());
            
            model.addAttribute("member", member.get()); // 로그인한 회원 정보를 모델에 저장
            return "redirect:/user/";  // 로그인 성공 후 홈 페이지로 리디렉션
        } else {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 잘못되었습니다.");
            model.addAttribute("id", id); // 로그인 실패 시, 사용자가 입력한 id 값을 다시 전달
            return "user/member/memberJoinForm"; // 로그인 실패 시 로그인 페이지로 돌아감
        }
    }
    
    // 아이디 찾기로 이동
    @GetMapping("/findId")
    public String showMemberFindId(Model model) {
    	System.out.println("[UserMemberController] showMemberFindId");
        return "user/member/memberFindId"; // memberFindId.jsp를 반환
    }
    
    // 아이디 찾기
    @PostMapping("/findId")
    public String findId(@RequestParam("name") String name,
                          @RequestParam("phone") String phone,
                          Model model, HttpServletRequest request) {
        System.out.println("[UserMemberController] findId");

        // 서비스에서 아이디 찾기
        Optional<String> foundId = userMemberService.findIdByNameAndPhone(name, phone);

        if (foundId.isPresent()) {
            // 아이디가 존재하는 경우
            request.setAttribute("foundId", "입력하신 정보에 해당하는 아이디는 " + foundId.get() + " 입니다.");
        } else {
            // 아이디가 존재하지 않는 경우
            request.setAttribute("foundId", "입력한 정보로 등록된 아이디가 없습니다.");
        }

        // 아이디 찾기 결과 페이지로 포워딩
        return "user/member/memberFindIdResult";  // memberFindIdResult.jsp
    }
    
    
    // 비밀번호 찾기로 이동
    @GetMapping("/findPassword")
    public String showMemberFindPassword(Model model) {
    	System.out.println("[UserMemberController] showMemberFindPassword");
        return "user/member/memberFindPassword"; // memberFindId.jsp를 반환
    }
    
    @PostMapping("/findPassword")
    public String findPassword(@RequestParam("id") String id,
                                @RequestParam("phone") String phone,
                                Model model, HttpServletRequest request) {
        System.out.println("[UserMemberController] findPassword");

        // 서비스에서 비밀번호 찾기
        Optional<String> foundPassword = userMemberService.findPasswordByIdAndPhone(id, phone);

        if (foundPassword.isPresent()) {
            // 비밀번호가 존재하는 경우
            request.setAttribute("foundPassword", "입력하신 정보에 해당하는 비밀번호는 " + foundPassword.get() + " 입니다.");
        } else {
            // 비밀번호가 존재하지 않는 경우
            request.setAttribute("foundPassword", "입력한 정보로 등록된 비밀번호가 없습니다.");
        }

        // 비밀번호 찾기 결과 페이지로 포워딩
        return "user/member/memberFindPasswordResult";  // memberFindPasswordResult.jsp
    }   
    
    
	 // 로그아웃 처리
	 @GetMapping("/logout")
	 public String logoutMember(HttpSession session) {
	     System.out.println("[UserMemberController] logoutMember");
	        
	     // 세션에서 사용자 정보를 제거
	     session.invalidate();  // 세션 무효화
	        
	     return "user/home";  // 로그아웃 후 홈 페이지로 리디렉션
	 }
	
	 
	 // 마이페이지 페이지로 이동
	 @GetMapping("/mypage")
	 public String showMemberMyPage(HttpSession session, Model model) {
	     System.out.println("[UserMemberController] showMemberMyPage");
	        
	     // 세션에서 로그인한 사용자 정보 가져오기
	     UserMemberVo loggedInUser = (UserMemberVo) session.getAttribute("loggedInUser");
	
	     if (loggedInUser == null) {
	         return "user/member/memberJoinForm";  // 로그인 안 한 경우 로그인 페이지로 리디렉션
	     }
	
	     model.addAttribute("loggedInUser", loggedInUser);  // 마이페이지에 사용자 정보 전달
	     return "user/member/mypage";  // 마이페이지로 이동
	 }
	 
	 // 수정하기 페이지로 이동
	 @GetMapping("/editProfileForm")
	 public String showEditProfileForm(HttpSession session, Model model) {
	     System.out.println("[UserMemberController] showEditProfileForm");

	     // 세션에서 로그인한 사용자 정보 가져오기
	     UserMemberVo loggedInUser = (UserMemberVo) session.getAttribute("loggedInUser");

	     if (loggedInUser == null) {
	         return "user/member/memberJoinForm";  // 로그인 안 한 경우 로그인 페이지로 리디렉션
	     }

	     model.addAttribute("loggedInUser", loggedInUser);  // 수정할 사용자 정보 전달
	     return "user/member/editProfileForm";  // 회원 정보 수정 페이지로 이동
	 }

	 // 수정하기 처리
	 @PostMapping("/updateProfile")
	 public String updateProfile(@ModelAttribute UserMemberVo updatedMember, HttpSession session, Model model) {
	     System.out.println("[UserMemberController] updateProfile");
	     System.out.println(updatedMember);

	     // 세션에서 로그인한 사용자 정보 가져오기
	     UserMemberVo loggedInUser = (UserMemberVo) session.getAttribute("loggedInUser");

	     if (loggedInUser == null) {
	         return "user/member/memberLoginForm";  // 로그인 안 한 경우 로그인 페이지로 리디렉션
	     }

	     // 수정된 회원 정보에 로그인한 사용자 ID를 추가
	     updatedMember.setId(loggedInUser.getId());

	     // 서비스에서 회원 정보 수정 처리
	     boolean success = userMemberService.updateMember(updatedMember);

	     if (success) {
	         // 수정된 정보를 세션에 반영
	         session.setAttribute("loggedInUser", updatedMember);

	         model.addAttribute("message", "회원 정보가 성공적으로 수정되었습니다.");
	         return "redirect:/user/member/mypage";  // 수정 완료 후 마이페이지로 이동
	     } else {
	         model.addAttribute("message", "회원 정보 수정에 실패했습니다. 다시 시도해 주세요.");
	         return "user/member/editProfileForm";  // 실패 시 수정 페이지로 돌아감
	     }
	 }



	 

    
    

}