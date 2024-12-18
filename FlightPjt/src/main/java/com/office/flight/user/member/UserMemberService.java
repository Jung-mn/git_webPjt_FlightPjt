package com.office.flight.user.member;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserMemberService {
    @Autowired
    private UserMemberDao userMemberDao;
//    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    
    // 회원가입 처리 메서드
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
 
    
    // 로그인 찾기 메서드
    public Optional<String> findIdByNameAndPhone(String name, String phone) {
        System.out.println("[UserMemberService] findIdByNameAndPhone");
        
        // DAO에서 아이디 찾기
        return userMemberDao.findIdByNameAndPhone(name, phone);
    }

   
    // 로그인 찾기 메서드
    public Optional<String> findPasswordByIdAndPhone(String id, String phone) {
        System.out.println("[UserMemberService] findPasswordByIdAndPhone");
        
        // DAO에서 아이디 찾기
        return userMemberDao.findPasswordByIdAndPhone(id, phone);
    }

    
    // 회원 정보 수정 처리 메서드
    public boolean updateMember(UserMemberVo updatedMember) {
        System.out.println("[UserMemberService] updateMember");
        // 비밀번호 암호화가 필요하다면 여기에 추가할 수 있음
        // String encryptedPassword = passwordEncoder.encode(updatedMember.getPassword());
        // updatedMember.setPassword(encryptedPassword);
        
        int result = userMemberDao.updateMember(updatedMember);
        return result > 0;  // 성공적으로 업데이트된 경우 true 반환
    }


    
    

}
