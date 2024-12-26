package com.office.flight.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.ExchangeStrategies;
import org.springframework.web.reactive.function.client.WebClient;

import io.netty.handler.timeout.ReadTimeoutHandler;
import io.netty.handler.timeout.WriteTimeoutHandler;
import reactor.netty.http.client.HttpClient;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import java.time.Duration;
import java.util.concurrent.TimeUnit;

@Configuration
public class WebClientConfig {
    int maxInMemorySize = 16 * 1024 * 1024; // 16MB  

    @Bean
    public WebClient webClient() {
        // HttpClient 설정
        HttpClient httpClient = HttpClient.create()
                .responseTimeout(Duration.ofSeconds(20))  // 응답 타임아웃 설정
                .doOnConnected(i ->  
                    i.addHandlerLast(new ReadTimeoutHandler(10000, TimeUnit.MILLISECONDS))  
                    .addHandlerLast(new WriteTimeoutHandler(10000, TimeUnit.MILLISECONDS))
                );

        // WebClient 설정
        return WebClient.builder()
                .baseUrl("https://test.api.amadeus.com") // 기본 API URL 설정
                .defaultHeader("Content-Type", "application/json")
                .exchangeStrategies(ExchangeStrategies.builder()  
                        .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(maxInMemorySize))  
                        .build())  
                .clientConnector(new ReactorClientHttpConnector(httpClient)) // HttpClient 설정
                .build();
    }
}
