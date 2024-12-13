package com.office.flight.user.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
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
    
    public Optional<UserMemberVo> findByIdAndPassword(String id, String password) {
        String sql = "SELECT id, koreanName, englishLastName, englishFirstName, password, birthdate, gender, email, phone, region " +
                     "FROM member WHERE id = :id AND password = :password";

        // 파라미터를 Map으로 설정
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("password", password);

        // namedParameterJdbcTemplate 사용하여 쿼리 실행
        return namedParameterJdbcTemplate.query(sql, params, new RowMapper<UserMemberVo>() {
            @Override
            public UserMemberVo mapRow(ResultSet rs, int rowNum) throws SQLException {
                UserMemberVo user = new UserMemberVo();
                user.setId(rs.getString("id"));
                user.setKoreanName(rs.getString("koreanName"));
                user.setEnglishLastName(rs.getString("englishLastName"));
                user.setEnglishFirstName(rs.getString("englishFirstName"));
                user.setPassword(rs.getString("password"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRegion(rs.getString("region"));
                return user;
            }
        }).stream().findFirst();  // 첫 번째 결과를 Optional로 반환
    }

}
