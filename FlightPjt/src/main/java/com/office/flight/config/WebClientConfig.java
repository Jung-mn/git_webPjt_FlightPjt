package com.office.flight.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.netty.http.client.HttpClient;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import java.time.Duration;

@Configuration
public class WebClientConfig {

    @Bean
    public WebClient webClient() {
        // HttpClient 설정
        HttpClient httpClient = HttpClient.create()
                .responseTimeout(Duration.ofSeconds(10));  // 응답 타임아웃 설정 (필요시 조정)

        return WebClient.builder()
                .baseUrl("https://test.api.amadeus.com")
                .defaultHeader("Content-Type", "application/json")
                .clientConnector(new ReactorClientHttpConnector(httpClient)) // 커넥터 설정
                .build();
    }
}
