package com.office.flight.user.member;

import com.office.flight.user.member.UserMemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserMemberDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int join(UserMemberVo member) {
        String sql = "INSERT INTO member (id, koreanName, englishLastName, englishFirstName, password, birthdate, gender, email, phone, region) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        return jdbcTemplate.update(sql, member.getId(), member.getKoreanName(), member.getEnglishLastName(),
            member.getEnglishFirstName(), member.getPassword(), member.getBirthdate(), member.getGender(),
            member.getEmail(), member.getPhone(), member.getRegion());
    }
}
