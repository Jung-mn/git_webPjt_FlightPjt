package com.office.flight.user.member;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserMemberService {
    @Autowired
    private UserMemberDao userMemberDao;
//    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    
    public boolean registerMember(UserMemberVo member) {
    	
    	System.out.println("[UserMemberService] registerMember");
    	
        // 비밀번호 암호화 및 기타 검증 로직을 추가
/*    	String encryptedPassword = passwordEncoder.encode(member.getPassword());
        member.setPassword(encryptedPassword); */
        
        int result = userMemberDao.join(member);
        return result > 0; // 성공 시 true 반환
    }
    
    // 로그인 처리 메서드
    public Optional<UserMemberVo> loginMember(String id, String password) {
    	
    	System.out.println("[UserMemberService] loginMember");
        // Dao에서 사용자 조회
        return userMemberDao.findByIdAndPassword(id, password);
    }
}
