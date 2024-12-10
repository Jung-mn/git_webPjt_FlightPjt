package com.example.demo.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HelloRepository {

    private final JdbcTemplate jdbcTemplate;

    public HelloRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public String testDatabase() {
        return jdbcTemplate.queryForObject("SELECT 'DB 연결 성공!'", String.class);
    }
}
