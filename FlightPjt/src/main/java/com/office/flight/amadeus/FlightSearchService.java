package com.office.flight.amadeus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Service
public class FlightSearchService {

    @Autowired
    private WebClient webClient;

    public String searchFlights(String origin, String destination, String departureDate, int adults, int children, String accessToken) {
        
//    	// URL을 로그로 출력해서 확인
//        String url = webClient.get()
//                .uri(uriBuilder -> uriBuilder
//                        .path("/v2/shopping/flight-offers")
//                        .queryParam("originLocationCode", origin)
//                        .queryParam("destinationLocationCode", destination)
//                        .queryParam("departureDate", departureDate)
//                        .queryParam("returnDate", returnDate)
//                        .queryParam("adults", adults)
//                        .queryParam("children", children)
//                        .queryParam("limit", 2)  // 한 번에 5개의 항공편만 받기
//                        .queryParam("offset", 0)  // 첫 번째 페이지
//                        .build())
//                .header("Authorization", "Bearer " + accessToken)
//                .toString(); // URI를 문자열로 변환
//
//        // 실제 요청 전에 URL을 출력하여 확인
//        System.out.println("Request URL: " + url);
    	
    	
    	// API 호출
        Mono<String> response = webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/v2/shopping/flight-offers")
                        .queryParam("originLocationCode", origin)
                        .queryParam("destinationLocationCode", destination)
                        .queryParam("departureDate", departureDate)
                        .queryParam("adults", adults)
                        .queryParam("children", children)
                        .build())
                .header("Authorization", "Bearer " + accessToken)
                .retrieve()
                .bodyToMono(String.class);

        return response.block(); // 동기식으로 결과 반환
    }
}
