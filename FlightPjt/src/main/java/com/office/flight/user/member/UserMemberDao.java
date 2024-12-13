package com.office.flight.user.member;

import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserMemberDao {
    
    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    
    public int join(UserMemberVo member) {
        String sql = "INSERT INTO member (id, koreanName, englishLastName, englishFirstName, password, birthdate, gender, email, phone, region) " +
                     "VALUES (:id, :koreanName, :englishLastName, :englishFirstName, :password, :birthdate, :gender, :email, :phone, :region)";
        
        // 파라미터를 Map으로 매핑
        Map<String, Object> params = new HashMap<>();
        params.put("id", member.getId());
        params.put("koreanName", member.getKoreanName());
        params.put("englishLastName", member.getEnglishLastName());
        params.put("englishFirstName", member.getEnglishFirstName());
        params.put("password", member.getPassword());
        params.put("birthdate", member.getBirthdate());
        params.put("gender", member.getGender());
        params.put("email", member.getEmail());
        params.put("phone", member.getPhone());
        params.put("region", member.getRegion());

        // SQL 실행 및 결과 반환
        return namedParameterJdbcTemplate.update(sql, params);
    }
}
